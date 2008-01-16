class V1DataElementController < ApplicationController
    active_scaffold :v1_data_element do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show
      config.list.columns= [
        :data_element_sequence,
        :group_num,
        :item_visits,
        :var_name,
        :v1_item_usages
      ]
      config.columns[:data_element_sequence].label = "Order"
      config.columns[:group_num].label = "Group#"
      config.columns[:item_visits].label = "Visit#"
      config.columns[:var_name].label = "VarName"
      config.columns[:v1_item_usages].label = "Item Usages"
      config.list.sorting = [{:data_element_sequence => :ASC}]          
    end
end
