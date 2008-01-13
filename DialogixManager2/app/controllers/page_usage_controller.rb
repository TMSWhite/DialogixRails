class PageUsageController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :page_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:page_usage_sequence, :display_num, :from_group_num, :language_code, 
                           :status_msg, :time_stamp,  :total_duration, :page_usage_events] 
    config.columns[:display_num].label = "Display"
    config.columns[:from_group_num].label = "From Group"
    config.columns[:language_code].label = "Language"
    config.columns[:total_duration].label = "Duration"
    config.columns[:status_msg].label = "Status"
    config.columns[:page_usage_sequence].label = "Page Sequence"
    config.list.sorting = [{:page_usage_sequence => :ASC}]        
  end
end
