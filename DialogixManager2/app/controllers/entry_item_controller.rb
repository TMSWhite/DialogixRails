class EntryItemController < ApplicationController
  
  #layout "activescaffold"   
  active_scaffold :entry_item do |config|
    
    columns[:display_type].ui_type = :select 
    config.create.columns = [:name, :relevance, :question, :display_type,  :entry_answers] 
    config.update.columns = [:name, :relevance, :question, :display_type,  :entry_answers] 
    config.list.columns = [:name, :relevance, :question, :display_type, :entry_answers] 
    
    #config.action_links.columns.add 'answer_link', :label => 'Answers', :page => true
    
        
  end
  
  #def answer_link
  #      render :active_scaffold => 'entry_answer', :label => 'Answers' 
  #end

end
