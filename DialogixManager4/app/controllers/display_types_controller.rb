class DisplayTypesController < ApplicationController
  active_scaffold :dialogix_user
  # GET /display_types
  # GET /display_types.xml
  def index
    @display_types = DisplayType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @display_types }
    end
  end

  # GET /display_types/1
  # GET /display_types/1.xml
  def show
    @display_type = DisplayType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @display_type }
    end
  end

  # GET /display_types/new
  # GET /display_types/new.xml
  def new
    @display_type = DisplayType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @display_type }
    end
  end

  # GET /display_types/1/edit
  def edit
    @display_type = DisplayType.find(params[:id])
  end

  # POST /display_types
  # POST /display_types.xml
  def create
    @display_type = DisplayType.new(params[:display_type])

    respond_to do |format|
      if @display_type.save
        flash[:notice] = 'DisplayType was successfully created.'
        format.html { redirect_to(@display_type) }
        format.xml  { render :xml => @display_type, :status => :created, :location => @display_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @display_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /display_types/1
  # PUT /display_types/1.xml
  def update
    @display_type = DisplayType.find(params[:id])

    respond_to do |format|
      if @display_type.update_attributes(params[:display_type])
        flash[:notice] = 'DisplayType was successfully updated.'
        format.html { redirect_to(@display_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @display_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /display_types/1
  # DELETE /display_types/1.xml
  def destroy
    @display_type = DisplayType.find(params[:id])
    @display_type.destroy

    respond_to do |format|
      format.html { redirect_to(display_types_url) }
      format.xml  { head :ok }
    end
  end
end
