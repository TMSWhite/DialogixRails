class V1PageUsagesController < ApplicationController
  active_scaffold :v1_page_usage do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show      
      config.list.columns= [
        :display_num,
        :action_type,
        :language_code,
        :server_duration,
        :load_duration,
        :page_duration,
        :network_duration,
        :total_duration
      ]
      config.list.sorting = [{:display_num => :ASC}]          
    end
  # GET /v1_page_usages
  # GET /v1_page_usages.xml
  #def index
  #  @v1_page_usages = V1PageUsage.find(:all)
  
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @v1_page_usages }
  #  end
  #end

  # GET /v1_page_usages/1
  # GET /v1_page_usages/1.xml
  def show_rest
    @v1_page_usage = V1PageUsage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @v1_page_usage }
    end
  end

  # GET /v1_page_usages/new
  # GET /v1_page_usages/new.xml
  def new_rest
    @v1_page_usage = V1PageUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @v1_page_usage }
    end
  end

  # GET /v1_page_usages/1/edit
  def edit_rest
    @v1_page_usage = V1PageUsage.find(params[:id])
  end

  # POST /v1_page_usages
  # POST /v1_page_usages.xml
  def create_rest
    @v1_page_usage = V1PageUsage.new(params[:v1_page_usage])

    respond_to do |format|
      if @v1_page_usage.save
        flash[:notice] = 'V1PageUsage was successfully created.'
        format.html { redirect_to(@v1_page_usage) }
        format.xml  { render :xml => @v1_page_usage, :status => :created, :location => @v1_page_usage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @v1_page_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /v1_page_usages/1
  # PUT /v1_page_usages/1.xml
  def update_rest
    @v1_page_usage = V1PageUsage.find(params[:id])

    respond_to do |format|
      if @v1_page_usage.update_attributes(params[:v1_page_usage])
        flash[:notice] = 'V1PageUsage was successfully updated.'
        format.html { redirect_to(@v1_page_usage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @v1_page_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /v1_page_usages/1
  # DELETE /v1_page_usages/1.xml
  def destroy_rest
    @v1_page_usage = V1PageUsage.find(params[:id])
    @v1_page_usage.destroy

    respond_to do |format|
      format.html { redirect_to(v1_page_usages_url) }
      format.xml  { head :ok }
    end
  end
end
