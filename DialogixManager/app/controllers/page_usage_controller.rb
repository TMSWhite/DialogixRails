class PageUsageController < ApplicationController
  layout "activescaffold"   
  active_scaffold :page_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:PageUsageSequence, :DisplayNum, :FromGroupNum, :LanguageCode, 
                           :StatusMsg, :Time_Stamp,  :totalDuration, :page_usage_events] 
    config.columns[:DisplayNum].label = "Display"
    config.columns[:FromGroupNum].label = "From Group"
    config.columns[:LanguageCode].label = "Language"
    config.columns[:totalDuration].label = "Duration"
    config.columns[:StatusMsg].label = "Status"
    config.columns[:PageUsageSequence].label = "Page Sequence"
    config.list.sorting = [{:PageUsageSequence => :ASC}]        
  end

end
