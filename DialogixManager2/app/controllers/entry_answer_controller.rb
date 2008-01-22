class EntryAnswerController < ApplicationController
  active_scaffold :entry_answer do |config|
    #config.actions << :sortable 
    # Answer create form edits group
    config.create.columns = [:name, :answer_code]     
    # Answer update form edits group
    config.update.columns = [:name, :answer_code] 
    config.list.columns = [:position, :name]   
    config.columns[:name].label = "Answer List"
    
    
  end
end
