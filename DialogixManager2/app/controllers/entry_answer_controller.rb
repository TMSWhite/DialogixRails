class EntryAnswerController < ApplicationController
  active_scaffold :entry_answer do |config|
    #config.actions << :sortable 
    # Answer create form edits group
    config.create.columns = [:name, :answer_code]     
    # Answer update form edits group
    config.update.columns = [:name, :answer_code] 
    
    config.columns[:name].collapsed = true
    config.columns[:answer_code].collapsed = true
    
    config.columns[:name].description = "Enter Code"
    
    config.list.columns = [:position, :name]   
    config.columns[:name].label = "Answer List"
    
    
  end
end
