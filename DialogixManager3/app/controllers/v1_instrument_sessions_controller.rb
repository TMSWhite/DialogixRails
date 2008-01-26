class V1InstrumentSessionsController < ApplicationController
  active_scaffold :v1_instrument_session do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:update
    config.actions.exclude:show    
    config.list.columns= [
      :v1_instrument_session_id,
      :instrument_version_name,
      :start_time,
      :last_access_time,
      :language_code,
      :display_num,
      :current_group,
      :v1_data_elements,
      :v1_page_usages
    ]
    config.columns[:instrument_version_name].label = "Instrument"
    config.columns[:start_time].label = "Start Time"
    config.columns[:last_access_time].label = "Last Access"
    config.columns[:language_code].label = "Language"
    config.columns[:display_num].label = "Display#"
    config.columns[:current_group].label = "Group#"
    config.columns[:v1_data_elements].label = "Data Values"
    config.columns[:v1_page_usages].label = "Page Views"
    config.list.sorting = [{:start_time => :ASC}]    
    
  end
 
  # GET /v1_instrument_sessions
  # GET /v1_instrument_sessions.xml
  #def index
  #  @v1_instrument_sessions = V1InstrumentSession.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @v1_instrument_sessions }
  #  end
  #end

  # GET /v1_instrument_sessions/1
  # GET /v1_instrument_sessions/1.xml
  def show_rest
    @v1_instrument_session = V1InstrumentSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @v1_instrument_session }
    end
  end

  # GET /v1_instrument_sessions/new
  # GET /v1_instrument_sessions/new.xml
  def new_rest
    @v1_instrument_session = V1InstrumentSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @v1_instrument_session }
    end
  end

  # GET /v1_instrument_sessions/1/edit
  def edit_rest
    @v1_instrument_session = V1InstrumentSession.find(params[:id])
  end

  # POST /v1_instrument_sessions
  # POST /v1_instrument_sessions.xml
  def create_rest
    @v1_instrument_session = V1InstrumentSession.new(params[:v1_instrument_session])

    respond_to do |format|
      if @v1_instrument_session.save
        flash[:notice] = 'V1InstrumentSession was successfully created.'
        format.html { redirect_to(@v1_instrument_session) }
        format.xml  { render :xml => @v1_instrument_session, :status => :created, :location => @v1_instrument_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @v1_instrument_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /v1_instrument_sessions/1
  # PUT /v1_instrument_sessions/1.xml
  def update
    @v1_instrument_session = V1InstrumentSession.find(params[:id])

    respond_to do |format|
      if @v1_instrument_session.update_attributes(params[:v1_instrument_session])
        flash[:notice] = 'V1InstrumentSession was successfully updated.'
        format.html { redirect_to(@v1_instrument_session) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @v1_instrument_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /v1_instrument_sessions/1
  # DELETE /v1_instrument_sessions/1.xml
  def destroy
    @v1_instrument_session = V1InstrumentSession.find(params[:id])
    @v1_instrument_session.destroy

    respond_to do |format|
      format.html { redirect_to(v1_instrument_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
