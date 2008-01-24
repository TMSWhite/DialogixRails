class EntryInstrumentController < ApplicationController
  #layout "activescaffold"  
  active_scaffold :entry_instrument do |config|
    config.actions.exclude :delete
    # Link for all lists
    #config.action_links.add 'Submit', :label => 'Export to Server', :page => true
    config.columns[:name].label = "Name"
    # Instrument create form edits group
    config.create.columns = [:name, :version, :instrument_description, :entry_items] 
    # Instrument update form edits group
    config.update.columns = [:name, :version, :instrument_description, :entry_items]  
    config.lis t.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    # Below sets a link in the last column
    config.action_links.add 'submit_to_dialogix', :label => 'Submit', :type => :record, :page => true
    #config.list.sorting = [:position]
    #config.list.columns << :position
    #config.list.sorting = [{:name => :ASC}]   
  end 
  
  def submit_to_dialogix
    
  end
  
end
