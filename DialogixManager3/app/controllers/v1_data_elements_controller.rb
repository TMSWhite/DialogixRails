class V1DataElementsController < ApplicationController
  active_scaffold :v1_data_element do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show
      config.list.columns= [
        :data_element_sequence,
        :group_num,
        :item_visits,
        :var_name,
        :v1_item_usages
      ]
      config.columns[:data_element_sequence].label = "Order"
      config.columns[:group_num].label = "Group#"
      config.columns[:item_visits].label = "Visit#"
      config.columns[:var_name].label = "VarName"
      config.columns[:v1_item_usages].label = "Item Usages"
      config.list.sorting = [{:data_element_sequence => :ASC}]          
    end
  # GET /v1_data_elements
  # GET /v1_data_elements.xml
  #def index
  #  @v1_data_elements = V1DataElement.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @v1_data_elements }
  #  end
  #end

  # GET /v1_data_elements/1
  # GET /v1_data_elements/1.xml
  def show_rest
    @v1_data_element = V1DataElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @v1_data_element }
    end
  end

  # GET /v1_data_elements/new
  # GET /v1_data_elements/new.xml
  def new_rest
    @v1_data_element = V1DataElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @v1_data_element }
    end
  end

  # GET /v1_data_elements/1/edit
  def edit_rest
    @v1_data_element = V1DataElement.find(params[:id])
  end

  # POST /v1_data_elements
  # POST /v1_data_elements.xml
  def create_rest
    @v1_data_element = V1DataElement.new(params[:v1_data_element])

    respond_to do |format|
      if @v1_data_element.save
        flash[:notice] = 'V1DataElement was successfully created.'
        format.html { redirect_to(@v1_data_element) }
        format.xml  { render :xml => @v1_data_element, :status => :created, :location => @v1_data_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @v1_data_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /v1_data_elements/1
  # PUT /v1_data_elements/1.xml
  def update
    @v1_data_element = V1DataElement.find(params[:id])

    respond_to do |format|
      if @v1_data_element.update_attributes(params[:v1_data_element])
        flash[:notice] = 'V1DataElement was successfully updated.'
        format.html { redirect_to(@v1_data_element) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @v1_data_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /v1_data_elements/1
  # DELETE /v1_data_elements/1.xml
  def destroy
    @v1_data_element = V1DataElement.find(params[:id])
    @v1_data_element.destroy

    respond_to do |format|
      format.html { redirect_to(v1_data_elements_url) }
      format.xml  { head :ok }
    end
  end
end
