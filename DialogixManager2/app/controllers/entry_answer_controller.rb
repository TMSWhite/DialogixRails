class EntryAnswerController < ApplicationController
  active_scaffold :entry_answer do |config|
    #columns[:language_list].ui_type = :select 
    #config.list.columns = [:name] 
    
  end
end
