module PageUsagesHelper
  def page_usage_events_column(record)
    name = record.page_usage_events.size if record.page_usage_events.size > 0
  end  
end
