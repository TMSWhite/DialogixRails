class QuestionLocalizedsController < ApplicationController
  
  active_scaffold :question_localized do |config|  
    
    def conditions_in_collection
      ['language_code in (?)', ['en']]
    end
  end
  
  # GET /question_localizeds
  # GET /question_localizeds.xml
  #def index
  
  #  @question_localizeds = QuestionLocalized.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @question_localizeds }
  #  end
  #end

  # GET /question_localizeds/1
  # GET /question_localizeds/1.xml
  def show_rest
    @question_localized = QuestionLocalized.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question_localized }
    end
  end

  # GET /question_localizeds/new
  # GET /question_localizeds/new.xml
  def new_rest
    @question_localized = QuestionLocalized.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question_localized }
    end
  end

  # GET /question_localizeds/1/edit
  def edit_rest
    @question_localized = QuestionLocalized.find(params[:id])
  end

  # POST /question_localizeds
  # POST /question_localizeds.xml
  def create
    @question_localized = QuestionLocalized.new(params[:question_localized])

    respond_to do |format|
      if @question_localized.save
        flash[:notice] = 'QuestionLocalized was successfully created.'
        format.html { redirect_to(@question_localized) }
        format.xml  { render :xml => @question_localized, :status => :created, :location => @question_localized }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question_localized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /question_localizeds/1
  # PUT /question_localizeds/1.xml
  def update_rest
    @question_localized = QuestionLocalized.find(params[:id])

    respond_to do |format|
      if @question_localized.update_attributes(params[:question_localized])
        flash[:notice] = 'QuestionLocalized was successfully updated.'
        format.html { redirect_to(@question_localized) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question_localized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_localizeds/1
  # DELETE /question_localizeds/1.xml
  def destroy_rest
    @question_localized = QuestionLocalized.find(params[:id])
    @question_localized.destroy

    respond_to do |format|
      format.html { redirect_to(question_localizeds_url) }
      format.xml  { head :ok }
    end
  end
end
