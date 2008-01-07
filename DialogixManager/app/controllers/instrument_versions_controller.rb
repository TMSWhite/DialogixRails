class InstrumentVersionsController < ApplicationController
  layout "activescaffold"   
  active_scaffold :instrument_version do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:show
    config.actions.exclude:update
    config.actions.add:show
    config.list.columns = [:InstrumentVersionFileName, :VersionString, :instrument_sessions] 
    config.columns[:InstrumentVersionFileName].label = "File Name"
    config.columns[:VersionString].label = "Version"
  end
end
