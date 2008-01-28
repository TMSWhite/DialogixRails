class InstrumentSessionsController < ApplicationController
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
    
  end
  # GET /instrument_sessions
  # GET /instrument_sessions.xml
  #def index
  #  @instrument_sessions = InstrumentSession.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @instrument_sessions }
  #  end
  #end

  # GET /instrument_sessions/1
  # GET /instrument_sessions/1.xml
  def show_rest
    @instrument_session = InstrumentSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instrument_session }
    end
  end

  # GET /instrument_sessions/new
  # GET /instrument_sessions/new.xml
  def new_rest
    @instrument_session = InstrumentSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instrument_session }
    end
  end

  # GET /instrument_sessions/1/edit
  def edit_rest
    @instrument_session = InstrumentSession.find(params[:id])
  end

  # POST /instrument_sessions
  # POST /instrument_sessions.xml
  def create_rest
    @instrument_session = InstrumentSession.new(params[:instrument_session])

    respond_to do |format|
      if @instrument_session.save
        flash[:notice] = 'InstrumentSession was successfully created.'
        format.html { redirect_to(@instrument_session) }
        format.xml  { render :xml => @instrument_session, :status => :created, :location => @instrument_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instrument_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instrument_sessions/1
  # PUT /instrument_sessions/1.xml
  def update_rest
    @instrument_session = InstrumentSession.find(params[:id])

    respond_to do |format|
      if @instrument_session.update_attributes(params[:instrument_session])
        flash[:notice] = 'InstrumentSession was successfully updated.'
        format.html { redirect_to(@instrument_session) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instrument_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_sessions/1
  # DELETE /instrument_sessions/1.xml
  def destroy_rest
    @instrument_session = InstrumentSession.find(params[:id])
    @instrument_session.destroy

    respond_to do |format|
      format.html { redirect_to(instrument_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
