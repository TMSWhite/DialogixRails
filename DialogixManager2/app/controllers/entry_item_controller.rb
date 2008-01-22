class EntryItemController < ApplicationController
  
  #layout "activescaffold"   
  active_scaffold :entry_item do |config|
    
    columns[:display_type].ui_type = :select 
    config.create.columns = [:name, :display_type, :relevance, :entry_question, :entry_answers] 
    config.update.columns = [:name, :display_type, :relevance, :entry_question, :entry_answers] 
    config.list.columns = [:name, :display_type, :relevance, :entry_question, :entry_answers]   
    
  end

end
