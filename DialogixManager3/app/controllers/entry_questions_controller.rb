class EntryQuestionsController < ApplicationController
  active_scaffold :entry_question do |config|
   
    
  end
  # GET /entry_questions
  # GET /entry_questions.xml
  #def index
  #  @entry_questions = EntryQuestion.find(:all)
  
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @entry_questions }
  #  end
  #end

  # GET /entry_questions/1
  # GET /entry_questions/1.xml
  def show_rest
    @entry_question = EntryQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_question }
    end
  end

  # GET /entry_questions/new
  # GET /entry_questions/new.xml
  def new_rest
    @entry_question = EntryQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_question }
    end
  end

  # GET /entry_questions/1/edit
  def edit_rest
    @entry_question = EntryQuestion.find(params[:id])
  end

  # POST /entry_questions
  # POST /entry_questions.xml
  def create_rest
    @entry_question = EntryQuestion.new(params[:entry_question])

    respond_to do |format|
      if @entry_question.save
        flash[:notice] = 'EntryQuestion was successfully created.'
        format.html { redirect_to(@entry_question) }
        format.xml  { render :xml => @entry_question, :status => :created, :location => @entry_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entry_questions/1
  # PUT /entry_questions/1.xml
  def update_rest
    @entry_question = EntryQuestion.find(params[:id])

    respond_to do |format|
      if @entry_question.update_attributes(params[:entry_question])
        flash[:notice] = 'EntryQuestion was successfully updated.'
        format.html { redirect_to(@entry_question) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_questions/1
  # DELETE /entry_questions/1.xml
  def destroy_rest
    @entry_question = EntryQuestion.find(params[:id])
    @entry_question.destroy

    respond_to do |format|
      format.html { redirect_to(entry_questions_url) }
      format.xml  { head :ok }
    end
  end
end
