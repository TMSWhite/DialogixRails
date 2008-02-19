class InstrumentSessionsController < ApplicationController
  require 'ruby-hl7'
  require 'socket'
  active_scaffold :instrument_session do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:start_time, :display_num, :current_var_name, :num_vars, :language_code,  
      :last_access_time, :item_usages, :page_usages] 
    config.columns[:start_time].label = "Start Time"
    config.columns[:display_num].label = "Display"
    config.columns[:current_var_name].label = "Current"
    config.columns[:language_code].label = "Language"
    config.columns[:last_access_time].label = "Last Accessed Time"
    config.list.sorting = [{:start_time => :ASC}]    
    config.action_links.add 'submit_hl7_message', :label => 'Send HL7', :type => :record, :page => true
    config.action_links.add 'display_xml', :label => 'XML', :type => :record, :page => true
  end
  
  def submit_hl7_message
    @instrument_session = InstrumentSession.find(params[:id])
    hl7_message
      
  end
  
  def display_xml
    @instrument_session = InstrumentSession.find(params[:id])
    respond_to do |format|
      format.xml  { render :xml => @instrument_session.item_usages }
    end    
  end
  
  def hl7_message
    # create a message
    sp = "^"
    local = "L"
    msg = HL7::Message.new
    # create a MSH segment 
    msh = HL7::Message::Segment::MSH.new
    # Add Message Header
    msg << msh 
    #nte = HL7::Message::Segment::NTE.new
    pid = HL7::Message::Segment::PID.new
    msg << pid
    orc = HL7::Message::Segment::Default.new
    msg << orc  # add the new segment to the message
    obr = HL7::Message::Segment::Default.new
    msg << obr       
    # Assemble Message
    msh.sending_app "Dialogix"
    msh.sending_facility = "OMH"    
    msh.version_id = "2.5"
    msh.message_type = "ORU"
    #msh.time_of_message = Time.now
    msh.message_control_id = rand(10000).to_s
    msh.processing_id = rand(10000).to_s
    # PID
    pid.patient_id_list = @instrument_session.dialogix_user.id.to_s
    pid.patient_name = @instrument_session.dialogix_user.first_name
    # ORC
    orc.e0 = "ORC"          
    orc.e1 = "100"   
    # OBR
    obr.e0 = "OBR"          
    obr.e1 = ""   
    obr.e2 = "" 
    obr.e3 = "" 
    obr.e4 = @instrument_session.instrument_version.id.to_s << 
      sp << 
      @instrument_session.instrument_version.instrument.name <<
      "(" << @instrument_session.instrument_version.name << ")" <<
      sp << local
    # OBX        
    @instrument_session.item_usages.each do |items|
      if (not items.answer_code.nil?)
        obx = HL7::Message::Segment::OBX.new 
        msg << obx  
        obx.value_type ="CE"
        obx.observation_id = items.id.to_s <<
          sp << items.question_as_asked <<
          sp << local << 
          sp << items.var_name.name <<
          obx.observation_sub_id = " "
        obx.observation_value = items.answer_id.to_s <<
          sp << items.answer_string <<
          sp << local <<
          sp << items.answer_code <<             
          obx.observation_result_status = "F"  
      end
    end       
            
    puts msg.to_s 
    @message_str = msg.to_s 
    # Send HL7 Message
    send_message(msg)
    
  end
  
  def send_message(msg)
    soc = TCPSocket.open( "localhost", 2100 ) rescue false
    if (soc)
      soc.write msg.to_mllp
      soc.close
      @message_str = msg.to_s << "<br> Message Sent!"
    else
      @message_str = "Connection Failed!"
    end
  end
 
end
