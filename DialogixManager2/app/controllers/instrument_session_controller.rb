class InstrumentSessionController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :instrument_session do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:start_time, :display_num, :current_var_name, :num_vars, :language_code,  
                           :last_access_time, :item_usages, :page_usages] 
    config.columns[:start_time].label = "Start Time"
    config.columns[:display_num].label = "Display"
    config.columns[:current_var_name].label = "Current"
    config.columns[:language_code].label = "Language"
    config.columns[:last_access_time].label = "Last Accessed Time"
    config.list.sorting = [{:start_time => :ASC}]    
    
  end
 
end
