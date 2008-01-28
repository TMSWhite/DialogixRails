class PageUsageEventsController < ApplicationController
  active_scaffold :page_usage_event do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    #config.list.columns = [:display_num, :FromGroupNum, :PageUsageSequence, :LanguageCode, 
    #                       :StatusMsg, :Time_Stamp,  :totalDuration, :page_usage] 
    config.columns[:gui_action_type].label = "GUI Action"
    config.columns[:page_usage_event_sequence].label = "Page Sequence"
    config.list.sorting = [{:page_usage_event_sequence => :ASC}]            
  end
  
  # GET /page_usage_events
  # GET /page_usage_events.xml
  #def index
  #  @page_usage_events = PageUsageEvent.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @page_usage_events }
  #  end
  #end

  # GET /page_usage_events/1
  # GET /page_usage_events/1.xml
  def show_rest
    @page_usage_event = PageUsageEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_usage_event }
    end
  end

  # GET /page_usage_events/new
  # GET /page_usage_events/new.xml
  def new_rest
    @page_usage_event = PageUsageEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_usage_event }
    end
  end

  # GET /page_usage_events/1/edit
  def edit_rest
    @page_usage_event = PageUsageEvent.find(params[:id])
  end

  # POST /page_usage_events
  # POST /page_usage_events.xml
  def create_rest
    @page_usage_event = PageUsageEvent.new(params[:page_usage_event])

    respond_to do |format|
      if @page_usage_event.save
        flash[:notice] = 'PageUsageEvent was successfully created.'
        format.html { redirect_to(@page_usage_event) }
        format.xml  { render :xml => @page_usage_event, :status => :created, :location => @page_usage_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_usage_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_usage_events/1
  # PUT /page_usage_events/1.xml
  def update_rest
    @page_usage_event = PageUsageEvent.find(params[:id])

    respond_to do |format|
      if @page_usage_event.update_attributes(params[:page_usage_event])
        flash[:notice] = 'PageUsageEvent was successfully updated.'
        format.html { redirect_to(@page_usage_event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_usage_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_usage_events/1
  # DELETE /page_usage_events/1.xml
  def destroy_rest
    @page_usage_event = PageUsageEvent.find(params[:id])
    @page_usage_event.destroy

    respond_to do |format|
      format.html { redirect_to(page_usage_events_url) }
      format.xml  { head :ok }
    end
  end
end
