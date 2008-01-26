class ItemUsagesController < ApplicationController
  active_scaffold :item_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.action_links.add 'export_csv', :label => 'Export to Excel', :page => true
    config.list.columns = [:display_num, :item_usage_sequence, :question_as_asked, :answer_string, :answer_code,  
                           :null_flavor, :language_code, :group_num,  :time_stamp, 
                           :instrument_session] 
    config.columns[:display_num].label = "Display Num"
    config.columns[:question_as_asked].label = "Question as Asked"
    config.columns[:language_code].label = "Language"
    config.columns[:answer_string].label = "Answer"
    config.columns[:answer_code].label = "Answer Code"
    config.columns[:item_usage_sequence].label = "Item Sequence"
    config.list.sorting = [{:item_usage_sequence => :ASC}]        
  end
  # GET /item_usages
  # GET /item_usages.xml
  #def index
  #  @item_usages = ItemUsage.find(:all)
  #
  #   respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @item_usages }
  #  end
  #end

  # GET /item_usages/1
  # GET /item_usages/1.xml
  def show_rest
    @item_usage = ItemUsage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_usage }
    end
  end

  # GET /item_usages/new
  # GET /item_usages/new.xml
  def new_rest
    @item_usage = ItemUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_usage }
    end
  end

  # GET /item_usages/1/edit
  def edit_rest
    @item_usage = ItemUsage.find(params[:id])
  end

  # POST /item_usages
  # POST /item_usages.xml
  def create_rest
    @item_usage = ItemUsage.new(params[:item_usage])

    respond_to do |format|
      if @item_usage.save
        flash[:notice] = 'ItemUsage was successfully created.'
        format.html { redirect_to(@item_usage) }
        format.xml  { render :xml => @item_usage, :status => :created, :location => @item_usage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_usages/1
  # PUT /item_usages/1.xml
  def update_rest
    @item_usage = ItemUsage.find(params[:id])

    respond_to do |format|
      if @item_usage.update_attributes(params[:item_usage])
        flash[:notice] = 'ItemUsage was successfully updated.'
        format.html { redirect_to(@item_usage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_usage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_usages/1
  # DELETE /item_usages/1.xml
  def destroy_rest
    @item_usage = ItemUsage.find(params[:id])
    @item_usage.destroy

    respond_to do |format|
      format.html { redirect_to(item_usages_url) }
      format.xml  { head :ok }
    end
  end
end
