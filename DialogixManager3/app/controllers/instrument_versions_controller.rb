class InstrumentVersionsController < ApplicationController
  active_scaffold :instrument_version do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:name, :instrument_contents, 
                           :instrument_sessions] 
    #config.columns[:instrument_version_fileName].label = "File Name"
    config.columns[:name].label = "Version"
  end
  # GET /instrument_versions
  # GET /instrument_versions.xml
  #def index
  #  @instrument_versions = InstrumentVersion.find(:all)
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @instrument_versions }
  #  end
  #end

  # GET /instrument_versions/1
  # GET /instrument_versions/1.xml
  def show_rest
    @instrument_version = InstrumentVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instrument_version }
    end
  end

  # GET /instrument_versions/new
  # GET /instrument_versions/new.xml
  def new_rest
    @instrument_version = InstrumentVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instrument_version }
    end
  end

  # GET /instrument_versions/1/edit
  def edit_rest
    @instrument_version = InstrumentVersion.find(params[:id])
  end

  # POST /instrument_versions
  # POST /instrument_versions.xml
  def create_rest
    @instrument_version = InstrumentVersion.new(params[:instrument_version])

    respond_to do |format|
      if @instrument_version.save
        flash[:notice] = 'InstrumentVersion was successfully created.'
        format.html { redirect_to(@instrument_version) }
        format.xml  { render :xml => @instrument_version, :status => :created, :location => @instrument_version }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instrument_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instrument_versions/1
  # PUT /instrument_versions/1.xml
  def update_rest
    @instrument_version = InstrumentVersion.find(params[:id])

    respond_to do |format|
      if @instrument_version.update_attributes(params[:instrument_version])
        flash[:notice] = 'InstrumentVersion was successfully updated.'
        format.html { redirect_to(@instrument_version) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instrument_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_versions/1
  # DELETE /instrument_versions/1.xml
  def destroy_rest
    @instrument_version = InstrumentVersion.find(params[:id])
    @instrument_version.destroy

    respond_to do |format|
      format.html { redirect_to(instrument_versions_url) }
      format.xml  { head :ok }
    end
  end
end
