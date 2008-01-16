class V1PageUsageController < ApplicationController
    active_scaffold :v1_page_usage do |config|
      config.actions.exclude:create
      config.actions.exclude:delete
      config.actions.exclude:update
      config.actions.exclude:show      
      config.list.columns= [
        :display_num,
        :action_type,
        :language_code,
        :server_duration,
        :load_duration,
        :page_duration,
        :network_duration,
        :total_duration
      ]
      config.list.sorting = [{:display_num => :ASC}]          
    end
end
