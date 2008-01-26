class EntryAnswersController < ApplicationController
  active_scaffold :entry_answer do |config|
    #config.actions << :sortable 
    # Answer create form edits group
    config.create.columns = [:name, :answer_code]     
    # Answer update form edits group
    config.update.columns = [:name, :answer_code] 
    
    config.columns[:name].collapsed = true
    config.columns[:answer_code].collapsed = true
    
    config.columns[:name].description = "Enter Code"
    
    config.list.columns = [:position, :name]   
    config.columns[:name].label = "Answer List"   
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
