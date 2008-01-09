class ItemUsageController < ApplicationController
  layout "activescaffold"   
  active_scaffold :item_usage do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.action_links.add 'export_csv', :label => 'Export to Excel', :page => true
    config.list.columns = [:DisplayNum, :ItemUsageSequence, :QuestionAsAsked, :AnswerString, :AnswerCode,  
                           :null_flavor, :LanguageCode, :GroupNum,  :Time_Stamp, 
                           :instrument_session, :instrument_content] 
    config.columns[:DisplayNum].label = "Display Num"
    config.columns[:QuestionAsAsked].label = "Question as Asked"
    config.columns[:LanguageCode].label = "Language"
    config.columns[:AnswerString].label = "Answer"
    config.columns[:AnswerCode].label = "Answer Code"
    config.columns[:ItemUsageSequence].label = "Item Sequence"
    config.list.sorting = [{:ItemUsageSequence => :ASC}]        
  end
  
  def export_csv
    records = find_page().items
    return if records.size == 0

    data = ""
    cls = records[0].class
    data << cls.csv_header << "\r\n"
    records.each do |inst|
      data << inst.to_csv << "\r\n"
    end
    send_data data, :type => 'text/csv', :filename => cls.name.pluralize + '.csv'
  end
 
  
end
