class InstrumentController < ApplicationController
  #active_scaffold :instrument
  layout "activescaffold"  
  active_scaffold :instrument do |config|
    config.actions.exclude :delete
    config.actions.exclude :search
    config.actions.add :live_search
    config.list.columns = [:InstrumentName, :InstrumentDescription, :instrument_versions] 
    config.columns[:InstrumentName].label = "Name"
    config.list.sorting = [{:InstrumentName => :ASC}]   
  end 
  
end
