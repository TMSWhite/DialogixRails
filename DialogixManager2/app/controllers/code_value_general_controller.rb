class CodeValueGeneralController < ApplicationController
  #layout "activescaffold"   
    active_scaffold :code_value_general do |config|    
    config.list.columns = [:code, :code_desc_txt, :code_system_cd, :is_modifiable_ind,
                           :status_cd]
    config.columns[:code_desc_txt].label = "Code Description"
    config.columns[:code_system_cd].label = "Code System"
    config.columns[:is_modifiable_ind].label = "Modifiable"
    #config.nested.add_link("Code Values", [:code_value_general])
  end
  
end
