class InstrumentContentController < ApplicationController
  layout "activescaffold"   
  active_scaffold :instrument_content do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:ItemSequence, :DefaultAnswer, :DisplayName, :GroupNum, :ItemActionType,  
                           :Relevance, :isRequired, :data_elements, :instrument_version, 
                           :item_usages] 
    config.columns[:DefaultAnswer].label = "Default Answer"
    config.columns[:DisplayName].label = "Diaplay Name"
    config.columns[:ItemActionType].label = "Action Type"
    config.columns[:isRequired].label = "Required"
    config.columns[:ItemSequence].label = "Item Sequence"
    config.list.sorting = [{:ItemSequence => :ASC}]        
  end
end
