class V1ItemUsageController < ApplicationController
    active_scaffold :v1_item_usage do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show      
      config.list.columns= [
        :item_usage_sequence,
        :language_code,
        :time_stamp,
        :item_visits,
        :display_num,
        :question_as_asked,
        :answer_string,
        :answer_code,
        :comments
      ]
      config.columns[:item_usage_sequence].label = "Order"
      config.columns[:language_code].label = "Language"
      config.columns[:time_stamp].label = "When"
      config.columns[:item_visits].label = "Visit#"
      config.columns[:display_num].label = "Display#"
      config.columns[:question_as_asked].label = "Question Asked"
      config.list.sorting = [{:item_usage_sequence => :ASC}]          
    end
end
