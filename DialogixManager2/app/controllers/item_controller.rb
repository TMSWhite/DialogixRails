class ItemController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :item do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:item_type, :question_id, :answer_list_id] 
        
  end
end
