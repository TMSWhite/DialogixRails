class ItemController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :item do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    #config.list.columns = [:item_type, :question_id, :answer_list_id] 
    #config.nested.add_link("Answers", [:answer_localized])
    
    #config.columns[:answer_localized].includes = [{'item' => 'answer_localized'}]
      
    def answer_view
      #@item_view = item.find(:all, :conditions => "''= ''")
      @answer_query = 
        item.find_by_sql(["SELECT items.item_id, items.item_type, answer_list_contents.answer_order, 
                                    answer_localizeds.language_code, answer_localizeds.name
                                    FROM items, answer_lists, answer_list_contents, answers, answer_localizeds
                                    WHERE items.answer_list_ID = answer_lists.answer_list_id
                                    AND answer_lists.answer_list_id = answer_list_contents.answer_list_id
                                    AND answer_list_contents.answer_id = answers.answer_id
                                    AND answers.answer_id = answer_localizeds.answer_id
                                    AND itemss.item_id = ?", @items.item_id]) 
    end        
  end

end
