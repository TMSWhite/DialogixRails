class PageUsageEventController < ApplicationController
  layout "activescaffold"   
  active_scaffold :page_usage_event
  active_scaffold :page_usage_event do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    #config.list.columns = [:DisplayNum, :FromGroupNum, :PageUsageSequence, :LanguageCode, 
    #                       :StatusMsg, :Time_Stamp,  :totalDuration, :page_usage_events] 
    config.columns[:GuiActionType].label = "GUI Action"
    config.columns[:PageUsageEventSequence].label = "Page Sequence"
    config.list.sorting = [{:PageUsageEventSequence => :ASC}]    
        
  end
end
