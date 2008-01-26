class InstrumentContentsController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :instrument_content do |config|    
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.add:show
    config.list.columns = [
      :item_sequence, 
      :group_num, 
      :var_name,  
      :relevance, 
      :item,
      :spss_format,
      :sas_informat,
      :sas_format
      ] 
    config.columns[:var_name].label = "VarName"
    config.columns[:item_sequence].label = "Order"
    config.list.sorting = [{:item_sequence => :ASC}]        
  end
  
  # GET /instrument_contents
  # GET /instrument_contents.xml
  #def index
  #  @instrument_contents = InstrumentContent.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @instrument_contents }
  #  end
  #end

  # GET /instrument_contents/1
  # GET /instrument_contents/1.xml
  def show_rest
    @instrument_content = InstrumentContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instrument_content }
    end
  end

  # GET /instrument_contents/new
  # GET /instrument_contents/new.xml
  def new_rest
    @instrument_content = InstrumentContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instrument_content }
    end
  end

  # GET /instrument_contents/1/edit
  def edit_rest
    @instrument_content = InstrumentContent.find(params[:id])
  end

  # POST /instrument_contents
  # POST /instrument_contents.xml
  def create_rest
    @instrument_content = InstrumentContent.new(params[:instrument_content])

    respond_to do |format|
      if @instrument_content.save
        flash[:notice] = 'InstrumentContent was successfully created.'
        format.html { redirect_to(@instrument_content) }
        format.xml  { render :xml => @instrument_content, :status => :created, :location => @instrument_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instrument_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instrument_contents/1
  # PUT /instrument_contents/1.xml
  def update_rest
    @instrument_content = InstrumentContent.find(params[:id])

    respond_to do |format|
      if @instrument_content.update_attributes(params[:instrument_content])
        flash[:notice] = 'InstrumentContent was successfully updated.'
        format.html { redirect_to(@instrument_content) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instrument_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_contents/1
  # DELETE /instrument_contents/1.xml
  def destroy_rest
    @instrument_content = InstrumentContent.find(params[:id])
    @instrument_content.destroy

    respond_to do |format|
      format.html { redirect_to(instrument_contents_url) }
      format.xml  { head :ok }
    end
  end
end
