class EntryItemsController < ApplicationController
  
  active_scaffold :entry_items do |config|    
    columns[:display_type].ui_type = :select 
    config.actions << :sortable
#    config.list.sorting = [:position]
    config.actions.exclude:delete
    config.actions.exclude:show
    #config.actions.add:show    
    config.create.columns = [:name, :relevance, :question, :display_type,  :entry_answers] 
    config.update.columns = [:name, :relevance, :question, :display_type,  :entry_answers] 
    config.list.columns = [:name, :relevance, :question, :display_type, :entry_answers]     
    #config.action_links.columns.add 'answer_link', :label => 'Answers', :page => true    
    
    config.action_links.add 'up', :label => 'Up', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'down', :label => 'Down', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'top', :label => 'Top', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'bottom', :label => 'Bottom', :type => :record, :position => false, :method => 'put' 
  end 


  def up 
    @entry_items = EntryItem.find(params[:id]) 
    @entry_items.move_higher 
    do_list 
    render :action => 'move' 
  end 


  def down 
    @entry_items = EntryItem.find(params[:id]) 
    @entry_items.move_lower 
    do_list 
    render :action => 'move' 
  end 


  def top 
    @entry_items = EntryItem.find(params[:id]) 
    @entry_items.move_to_top 
    do_list 
    render :action => 'move' 
  end 


  def bottom 
    @entry_items = EntryItem.find(params[:id]) 
    @entry_items.move_to_bottom 
    do_list 
    render :action => 'move' 
  end 

  def move 
  end 
   
  
  # GET /entry_items
  # GET /entry_items.xml
  def index_rest
    @entry_items = EntryItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entry_items }
    end
  end

  # GET /entry_items/1
  # GET /entry_items/1.xml
  def show_rest
    @entry_item = EntryItem.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.xml  { render :xml => @entry_item }
    end
  end

  # GET /entry_items/new
  # GET /entry_items/new.xml
  def new_rest
    @entry_item = EntryItem.new

    respond_to do |format|
      #format.html # new.html.erb
      format.xml  { render :xml => @entry_item }
    end
  end

  # GET /entry_items/1/edit
  def edit_rest
    @entry_item = EntryItem.find(params[:id])
  end

  # POST /entry_items
  # POST /entry_items.xml
  def create_rest
    @entry_item = EntryItem.new(params[:entry_item])

    respond_to do |format|
      if @entry_item.save
        flash[:notice] = 'EntryItem was successfully created.'
        #format.html { redirect_to(@entry_item) }
        format.xml  { render :xml => @entry_item, :status => :created, :location => @entry_item }
      else
        #format.html { render :action => "new" }
        format.xml  { render :xml => @entry_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entry_items/1
  # PUT /entry_items/1.xml
  def update_rest
    @entry_item = EntryItem.find(params[:id])

    respond_to do |format|
      if @entry_item.update_attributes(params[:entry_item])
        flash[:notice] = 'EntryItem was successfully updated.'
        #format.html { redirect_to(@entry_item) }
        format.xml  { head :ok }
      else
        #format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_items/1
  # DELETE /entry_items/1.xml
  def destroy_rest
    @entry_item = EntryItem.find(params[:id])
    @entry_item.destroy

    respond_to do |format|
      #format.html { redirect_to(entry_items_url) }
      format.xml  { head :ok }
    end
  end
 
end
