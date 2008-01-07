class InstrumentSessionController < ApplicationController
  layout "activescaffold"   
  active_scaffold :instrument_session do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:StartTime, :DisplayNum, :CurrentVarNum, :NumVars, :LanguageCode,  
                           :LastAccessTime, :item_usages, :page_usages] 
    config.columns[:StartTime].label = "Start Time"
    config.columns[:DisplayNum].label = "Display"
    config.columns[:CurrentVarNum].label = "Current"
    config.columns[:LanguageCode].label = "Language"
    config.columns[:LastAccessTime].label = "Last Accessed Time"
    config.list.sorting = [{:StartTime => :ASC}]    
    
  end
end
