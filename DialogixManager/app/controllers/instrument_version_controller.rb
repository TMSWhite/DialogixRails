class InstrumentVersionController < ApplicationController
  #layout "activescaffold"   
  active_scaffold :instrument_version do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:name, :instrument_contents, 
                           :instrument_sessions] 
    #config.columns[:instrument_version_fileName].label = "File Name"
    config.columns[:name].label = "Version"
  end
end
