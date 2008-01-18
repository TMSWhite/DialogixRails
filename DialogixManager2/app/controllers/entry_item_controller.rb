class EntryItemController < ApplicationController
  
  #layout "activescaffold"   
  active_scaffold :entry_item do |config|
    
    columns[:display_type].ui_type = :select 
    #config.list.columns = [:item_type, :question_id, :answer_list_id] 
    #config.nested.add_link("Answers", [:answer_localized])
    #columns[:question_localizeds].ui_type = :select 
    #config.columns[:answer_localized].includes = [{'item' => 'answer_localized'}] 

  end

end
