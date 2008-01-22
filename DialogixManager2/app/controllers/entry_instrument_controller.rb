class EntryInstrumentController < ApplicationController
  #layout "activescaffold"  
  active_scaffold :entry_instrument do |config|
    config.actions.add :live_search
    #config.list.columns = [:name, :version] 
    config.columns[:name].label = "Name"
    # Instrument create form edits group
    config.create.columns = [:name, :version, :instrument_description, :entry_items] 
    # Instrument update form edits group
    config.update.columns = [:name, :version, :instrument_description, :entry_items]  
    config.list.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    # Below sets a link in the last column
    #config.action_links.add 'reply_to_message', :label => 'Reply', :type => :record, :page => true
    #config.list.sorting = [:position]
    #config.list.columns << :position
    #config.list.sorting = [{:name => :ASC}]   
  end 
  
  
end
