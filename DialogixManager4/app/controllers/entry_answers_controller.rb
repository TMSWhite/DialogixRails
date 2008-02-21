class EntryAnswersController < ApplicationController
  active_scaffold :entry_answer do |config|
    config.actions << :sortable 
#    config.list.sorting = [:position] 
    config.actions.exclude:delete
    config.actions.exclude:show
    #config.actions.exclude:update
    #config.actions.add:show
    # Answer create form edits group
    config.create.columns = [:name, :answer_code]     
    # Answer update form edits group
    config.update.columns = [:name, :answer_code]     
    config.columns[:name].collapsed = true
    config.columns[:answer_code].collapsed = true    
    #config.columns[:name].description = "Enter Code"    
    config.list.columns = [:position, :name, :answer_code]   
    config.columns[:name].label = "Answer"   
    config.columns[:answer_code].label = "Code"  
    config.action_links.add 'up', :label => 'Up', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'down', :label => 'Down', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'top', :label => 'Top', :type => :record, :position => false, :method => 'put' 
    config.action_links.add 'bottom', :label => 'Bottom', :type => :record, :position => false, :method => 'put' 
  end
  
  def up 
    @items = EntryAnswer.find(params[:id]) 
    @items.move_higher 
    do_list 
    render :action => 'move' 
  end 


  def down 
    @items = EntryAnswer.find(params[:id])     
    @items.move_lower     
    do_list 
    render :action => 'move' 
  end 


  def top 
    @items = EntryAnswer.find(params[:id]) 
    @items.move_to_top 
    do_list 
    render :action => 'move' 
  end 


  def bottom 
    @items = EntryAnswer.find(params[:id]) 
    @items.move_to_bottom 
    do_list 
    render :action => 'move' 
  end 

  def move 
  end 
  
  # GET /entry_answers
  # GET /entry_answers.xml
  #def index
  #  @entry_answers = EntryAnswer.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @entry_answers }
  #  end
  #end

  # GET /entry_answers/1
  # GET /entry_answers/1.xml
  def show_rest
    @entry_answer = EntryAnswer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_answer }      
    end
  end

  # GET /entry_answers/new
  # GET /entry_answers/new.xml
  def new_rest
    @entry_answer = EntryAnswer.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_answer }
    end
  end

  # GET /entry_answers/1/edit
  def edit_rest
    @entry_answer = EntryAnswer.find(params[:id])
  end

  # POST /entry_answers
  # POST /entry_answers.xml
  def create_rest
    @entry_answer = EntryAnswer.new(params[:entry_answer])

    respond_to do |format|
      if @entry_answer.save
        flash[:notice] = 'EntryAnswer was successfully created.'
        format.html { redirect_to(@entry_answer) }
        format.xml  { render :xml => @entry_answer, :status => :created, :location => @entry_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entry_answers/1
  # PUT /entry_answers/1.xml
  def update_rest
    @entry_answer = EntryAnswer.find(params[:id])

    respond_to do |format|
      if @entry_answer.update_attributes(params[:entry_answer])
        flash[:notice] = 'EntryAnswer was successfully updated.'
        format.html { redirect_to(@entry_answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_answers/1
  # DELETE /entry_answers/1.xml
  def destroy_rest
    @entry_answer = EntryAnswer.find(params[:id])
    @entry_answer.destroy

    respond_to do |format|
      format.html { redirect_to(entry_answers_url) }
      format.xml  { head :ok }
    end
  end
end
