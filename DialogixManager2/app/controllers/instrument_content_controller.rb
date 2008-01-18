class InstrumentContentController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :instrument_content do |config|    
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.add:show
    config.list.columns = [
      :item_sequence, 
      :group_num, 
      :var_name,  
      :relevance, 
      :item,
      :spss_format,
      :sas_informat,
      :sas_format
      ] 
    config.columns[:var_name].label = "VarName"
    config.columns[:item_sequence].label = "Order"
    config.list.sorting = [{:item_sequence => :ASC}]        
  end
end
