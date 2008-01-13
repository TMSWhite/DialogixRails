class InstrumentController < ApplicationController
  #layout "activescaffold"  
  active_scaffold :instrument do |config|
    config.actions.exclude :create
    config.actions.exclude :delete
    config.actions.exclude :search
    config.actions.add :live_search
    config.list.columns = [:name, :instrument_description, :instrument_versions] 
    config.columns[:name].label = "Name"
    # Below sets a link in the last column
    #config.action_links.add 'reply_to_message', :label => 'Reply', :type => :record, :page => true
    config.list.sorting = [{:name => :ASC}]   
  end 
  
end
