class V1InstrumentSessionController < ApplicationController
  active_scaffold :v1_instrument_session do |config|
    config.actions.exclude:create
    config.actions.exclude:delete
    config.actions.exclude:update
    config.actions.exclude:show    
    config.list.columns= [
      :v1_instrument_session_id,
      :instrument_version_name,
      :start_time,
      :last_access_time,
      :language_code,
      :display_num,
      :current_group,
      :v1_data_elements,
      :v1_page_usages
    ]
    config.columns[:instrument_version_name].label = "Instrument"
    config.columns[:start_time].label = "Start Time"
    config.columns[:last_access_time].label = "Last Access"
    config.columns[:language_code].label = "Language"
    config.columns[:display_num].label = "Display#"
    config.columns[:current_group].label = "Group#"
    config.columns[:v1_data_elements].label = "Data Values"
    config.columns[:v1_page_usages].label = "Page Views"
    config.list.sorting = [{:start_time => :ASC}]    
    
  end
 
end
