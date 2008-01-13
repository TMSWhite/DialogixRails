class ItemUsageController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :item_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.action_links.add 'export_csv', :label => 'Export to Excel', :page => true
    config.list.columns = [:display_num, :item_usage_sequence, :question_as_asked, :answer_string, :answer_code,  
                           :null_flavor, :language_code, :group_num,  :time_stamp, 
                           :instrument_session, :instrument_content] 
    config.columns[:display_num].label = "Display Num"
    config.columns[:question_as_asked].label = "Question as Asked"
    config.columns[:language_code].label = "Language"
    config.columns[:answer_string].label = "Answer"
    config.columns[:answer_code].label = "Answer Code"
    config.columns[:item_usage_sequence].label = "Item Sequence"
    config.list.sorting = [{:item_usage_sequence => :ASC}]        
  end
end
