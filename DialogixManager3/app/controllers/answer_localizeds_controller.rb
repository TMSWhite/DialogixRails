class AnswerLocalizedsController < ApplicationController
   active_scaffold :answer_localized
  # GET /answer_localizeds
  # GET /answer_localizeds.xml
  #def index
  #  @answer_localizeds = AnswerLocalized.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @answer_localizeds }
  #  end
  #end

  # GET /answer_localizeds/1
  # GET /answer_localizeds/1.xml
  def show_rest
    @answer_localized = AnswerLocalized.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer_localized }
    end
  end

  # GET /answer_localizeds/new
  # GET /answer_localizeds/new.xml
  def new_rest
    @answer_localized = AnswerLocalized.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer_localized }
    end
  end

  # GET /answer_localizeds/1/edit
  def edit_rest
    @answer_localized = AnswerLocalized.find(params[:id])
  end

  # POST /answer_localizeds
  # POST /answer_localizeds.xml
  def create_rest
    @answer_localized = AnswerLocalized.new(params[:answer_localized])

    respond_to do |format|
      if @answer_localized.save
        flash[:notice] = 'AnswerLocalized was successfully created.'
        format.html { redirect_to(@answer_localized) }
        format.xml  { render :xml => @answer_localized, :status => :created, :location => @answer_localized }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer_localized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answer_localizeds/1
  # PUT /answer_localizeds/1.xml
  def update_rest
    @answer_localized = AnswerLocalized.find(params[:id])

    respond_to do |format|
      if @answer_localized.update_attributes(params[:answer_localized])
        flash[:notice] = 'AnswerLocalized was successfully updated.'
        format.html { redirect_to(@answer_localized) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer_localized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_localizeds/1
  # DELETE /answer_localizeds/1.xml
  def destroy_rest
    @answer_localized = AnswerLocalized.find(params[:id])
    @answer_localized.destroy

    respond_to do |format|
      format.html { redirect_to(answer_localizeds_url) }
      format.xml  { head :ok }
    end
  end
end
