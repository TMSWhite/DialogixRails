class InstrumentContentController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :instrument_content do |config|    
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:item_sequence, :group_num, :display_name,   
                           :relevance, :is_required, :default_answer, :item,
                           :display_type_id, :instrument_version] 
    config.columns[:default_answer].label = "Default Answer"
    config.columns[:display_name].label = "Diaplay Name"
    #config.columns[:item_action_type].label = "Action Type"
    config.columns[:is_required].label = "Required"
    config.columns[:item_sequence].label = "Item Sequence"
    config.list.sorting = [{:item_sequence => :ASC}]        
  end
end
