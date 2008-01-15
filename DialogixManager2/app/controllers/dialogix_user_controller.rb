class DialogixUserController < ApplicationController
  #layout "activescaffold"   
  
  active_scaffold :dialogix_user do |config|
    config.list.columns = [:user_name, :first_name, :last_name, :email, :instrument_sessions] 
    config.columns[:user_name].label = "User Name"
    config.list.sorting = [{:user_name => :ASC}]        
  end
end
