class PageUsagesController < ApplicationController
  active_scaffold :page_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:page_usage_sequence, :display_num, :from_group_num, :language_code, 
                           :status_msg, :time_stamp,  :total_duration, :page_usage_events] 
    config.columns[:display_num].label = "Display"
    config.columns[:from_group_num].label = "From Group"
    config.columns[:language_code].label = "Language"
    config.columns[:total_duration].label = "Duration"
    config.columns[:status_msg].label = "Status"
    config.columns[:page_usage_sequence].label = "Page Sequence"
    config.list.sorting = [{:page_usage_sequence => :ASC}]        
  end
  # GET /page_usages
  # GET /page_usages.xml
  #def index
  #  @page_usages = PageUsage.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @page_usages }
  #  end
  #end

  # GET /page_usages/1
  # GET /page_usages/1.xml
  def show_rest
    @page_usage = PageUsage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_usage }
    end
  end

  # GET /page_usages/new
  # GET /page_usages/new.xml
  def new_rest
    @page_usage = PageUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_usage }
    end
  end

  # GET /page_usages/1/edit
  def edit_rest
    @page_usage = PageUsage.find(params[:id])
  end

  # POST /page_usages
  # POST /page_usages.xml
  def create_rest
    @page_usage = PageUsage.new(params[:page_usage])

    respond_to do |format|
      if @page_usage.save
        flash[:notice] = 'PageUsage was successfully created.'
        format.html { redirect_to(@page_usage) }
        format.xml  { render :xml => @page_usage, :status => :created, :location => @page_usage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_usages/1
  # PUT /page_usages/1.xml
  def update_rest
    @page_usage = PageUsage.find(params[:id])

    respond_to do |format|
      if @page_usage.update_attributes(params[:page_usage])
        flash[:notice] = 'PageUsage was successfully updated.'
        format.html { redirect_to(@page_usage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_usages/1
  # DELETE /page_usages/1.xml
  def destroy_rest
    @page_usage = PageUsage.find(params[:id])
    @page_usage.destroy

    respond_to do |format|
      format.html { redirect_to(page_usages_url) }
      format.xml  { head :ok }
    end
  end
end
