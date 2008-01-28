class EntryInstrumentsController < ApplicationController
  active_scaffold :entry_instrument do |config|
    config.actions << :sortable
    config.actions.exclude :delete
    # Link for all lists
    #config.action_links.add 'Submit', :label => 'Export to Server', :page => true
    config.columns[:name].label = "Name"
    # Instrument create form edits group
    config.create.columns = [:name, :version, :instrument_description, :entry_items] 
    # Instrument update form edits group
    config.update.columns = [:name, :version, :instrument_description, :entry_items]  
    config.list.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    # Below sets a link in the last column
    config.action_links.add 'submit_to_dialogix', :label => 'Submit', :type => :record, :page => true
    #config.action_links.add 'index', :parameters => {:format => 'tsv'}, 
    #  :label => "Download", :page => true 
    #config.actions.add :export
    #config.export.show_form = false
    config.export.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    config.export.default_deselected_columns = [ :updated_on ]
    config.export.default_delimiter = ','
    config.export.force_quotes = true
    #config.list.sorting = [:position]
    #config.list.columns << :position
    config.list.sorting = [{:name => :ASC}]   
  end 
  # GET /entry_instruments
  # GET /entry_instruments.xml
  #def index
  #  @entry_instruments = EntryInstrument.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  
  #  format.xml  { render :xml => @entry_instruments }
  #  end
  #end

  
  # Called from ActiveScaffold submit action link 
  def submit_to_dialogix
    @entry_instrument = EntryInstrument.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.xml  { render :xml => @entry_instrument}
      #format.yaml  { render :yaml => @entry_instrument}
      #format.json  { render :json => @entry_instrument}
    end
  end
  
  def download_tsv
    @entry_instrument = EntryInstrument.find(params[:id])
    respond_to do |format|
      format.tsv  { render :tsv => @entry_instrument}
    end
  end
  
  # GET /entry_instruments/new
  # GET /entry_instruments/new.xml
  def new_rest
    @entry_instrument = EntryInstrument.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_instrument }
    end
  end

  # GET /entry_instruments/1/edit
  def edit_rest
    @entry_instrument = EntryInstrument.find(params[:id])
  end

  # POST /entry_instruments
  # POST /entry_instruments.xml
  def create_rest
    @entry_instrument = EntryInstrument.new(params[:entry_instrument])

    respond_to do |format|
      if @entry_instrument.save
        flash[:notice] = 'EntryInstrument was successfully created.'
        format.html { redirect_to(@entry_instrument) }
        format.xml  { render :xml => @entry_instrument, :status => :created, :location => @entry_instrument }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_instrument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entry_instruments/1
  # PUT /entry_instruments/1.xml
  def update_rest
    @entry_instrument = EntryInstrument.find(params[:id])

    respond_to do |format|
      if @entry_instrument.update_attributes(params[:entry_instrument])
        flash[:notice] = 'EntryInstrument was successfully updated.'
        format.html { redirect_to(@entry_instrument) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_instrument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_instruments/1
  # DELETE /entry_instruments/1.xml
  def destroy_rest
    @entry_instrument = EntryInstrument.find(params[:id])
    @entry_instrument.destroy

    respond_to do |format|
      format.html { redirect_to(entry_instruments_url) }
      format.xml  { head :ok }
    end
  end
  # GET /entry_instruments/new
  # GET /entry_instruments/new.xml
 
end
