class EntryInstrumentController < ApplicationController
  #layout "activescaffold"  
  active_scaffold :entry_instrument do |config|
    config.actions.add :live_search
    #config.list.columns = [:name, :version] 
    config.columns[:name].label = "Name"
    # Below sets a link in the last column
    #config.action_links.add 'reply_to_message', :label => 'Reply', :type => :record, :page => true
    config.list.sorting = [{:name => :ASC}]   
  end 
  
  
end
