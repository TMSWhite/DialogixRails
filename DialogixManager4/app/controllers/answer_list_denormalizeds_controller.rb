class AnswerListDenormalizedsController < ApplicationController
  active_scaffold :answer_list_denormalized do |config|
    config.actions = [:update, :show]
  end
  # GET /answer_list_denormalizeds
  # GET /answer_list_denormalizeds.xml
  #def index
  #  @answer_list_denormalizeds = AnswerListDenormalized.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @answer_list_denormalizeds }
  #  end
  #end

  # GET /answer_list_denormalizeds/1
  # GET /answer_list_denormalizeds/1.xml
  def show_rest
    @answer_list_denormalized = AnswerListDenormalized.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer_list_denormalized }
    end
  end

  # GET /answer_list_denormalizeds/new
  # GET /answer_list_denormalizeds/new.xml
  def new_rest
    @answer_list_denormalized = AnswerListDenormalized.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer_list_denormalized }
    end
  end

  # GET /answer_list_denormalizeds/1/edit
  def edit_rest
    @answer_list_denormalized = AnswerListDenormalized.find(params[:id])
  end

  # POST /answer_list_denormalizeds
  # POST /answer_list_denormalizeds.xml
  def create_rest
    @answer_list_denormalized = AnswerListDenormalized.new(params[:answer_list_denormalized])

    respond_to do |format|
      if @answer_list_denormalized.save
        flash[:notice] = 'AnswerListDenormalized was successfully created.'
        format.html { redirect_to(@answer_list_denormalized) }
        format.xml  { render :xml => @answer_list_denormalized, :status => :created, :location => @answer_list_denormalized }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer_list_denormalized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answer_list_denormalizeds/1
  # PUT /answer_list_denormalizeds/1.xml
  def update_rest
    @answer_list_denormalized = AnswerListDenormalized.find(params[:id])

    respond_to do |format|
      if @answer_list_denormalized.update_attributes(params[:answer_list_denormalized])
        flash[:notice] = 'AnswerListDenormalized was successfully updated.'
        format.html { redirect_to(@answer_list_denormalized) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer_list_denormalized.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_list_denormalizeds/1
  # DELETE /answer_list_denormalizeds/1.xml
  def destroy_rest
    @answer_list_denormalized = AnswerListDenormalized.find(params[:id])
    @answer_list_denormalized.destroy

    respond_to do |format|
      format.html { redirect_to(answer_list_denormalizeds_url) }
      format.xml  { head :ok }
    end
  end
end
