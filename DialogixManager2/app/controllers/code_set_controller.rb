class CodeSetController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :code_set do |config|
    config.list.columns.add :code_set_id 
    config.list.columns = [:code_set_id, :code_set_desc_txt, :code_system_cd, :is_modifiable_ind,
                           :status_cd]
    config.columns[:code_set_id].label = "Code Set ID"
    config.columns[:code_set_desc_txt].label = "Code Description"
    config.columns[:is_modifiable_ind].label = "Modifiable"
    config.columns[:code_system_cd].label = "Code System"
    
    config.nested.add_link("Code Values", [:code_value_general])
  end
end
