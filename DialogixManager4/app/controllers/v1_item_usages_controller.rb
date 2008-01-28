class V1ItemUsagesController < ApplicationController
  active_scaffold :v1_item_usage do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show      
      config.list.columns= [
        :item_usage_sequence,
        :language_code,
        :time_stamp,
        :item_visits,
        :display_num,
        :question_as_asked,
        :answer_string,
        :answer_code,
        :comments
      ]
      config.columns[:item_usage_sequence].label = "Order"
      config.columns[:language_code].label = "Language"
      config.columns[:time_stamp].label = "When"
      config.columns[:item_visits].label = "Visit#"
      config.columns[:display_num].label = "Display#"
      config.columns[:question_as_asked].label = "Question Asked"
      config.list.sorting = [{:item_usage_sequence => :ASC}]          
    end

  # GET /v1_item_usages
  # GET /v1_item_usages.xml
  #def index
  #  @v1_item_usages = V1ItemUsage.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @v1_item_usages }
  #  end
  #end

  # GET /v1_item_usages/1
  # GET /v1_item_usages/1.xml
  def show_rest
    @v1_item_usage = V1ItemUsage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @v1_item_usage }
    end
  end

  # GET /v1_item_usages/new
  # GET /v1_item_usages/new.xml
  def new_rest
    @v1_item_usage = V1ItemUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @v1_item_usage }
    end
  end

  # GET /v1_item_usages/1/edit
  def edit_rest
    @v1_item_usage = V1ItemUsage.find(params[:id])
  end

  # POST /v1_item_usages
  # POST /v1_item_usages.xml
  def create_rest
    @v1_item_usage = V1ItemUsage.new(params[:v1_item_usage])

    respond_to do |format|
      if @v1_item_usage.save
        flash[:notice] = 'V1ItemUsage was successfully created.'
        format.html { redirect_to(@v1_item_usage) }
        format.xml  { render :xml => @v1_item_usage, :status => :created, :location => @v1_item_usage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @v1_item_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /v1_item_usages/1
  # PUT /v1_item_usages/1.xml
  def update_rest
    @v1_item_usage = V1ItemUsage.find(params[:id])

    respond_to do |format|
      if @v1_item_usage.update_attributes(params[:v1_item_usage])
        flash[:notice] = 'V1ItemUsage was successfully updated.'
        format.html { redirect_to(@v1_item_usage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @v1_item_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /v1_item_usages/1
  # DELETE /v1_item_usages/1.xml
  def destroy_rest
    @v1_item_usage = V1ItemUsage.find(params[:id])
    @v1_item_usage.destroy

    respond_to do |format|
      format.html { redirect_to(v1_item_usages_url) }
      format.xml  { head :ok }
    end
  end
end
