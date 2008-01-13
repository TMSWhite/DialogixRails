class PageUsageEventController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :page_usage_event do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    #config.list.columns = [:display_num, :FromGroupNum, :PageUsageSequence, :LanguageCode, 
    #                       :StatusMsg, :Time_Stamp,  :totalDuration, :page_usage] 
    config.columns[:gui_action_type].label = "GUI Action"
    config.columns[:page_usage_event_sequence].label = "Page Sequence"
    config.list.sorting = [{:page_usage_event_sequence => :ASC}]    
        
  end
end
