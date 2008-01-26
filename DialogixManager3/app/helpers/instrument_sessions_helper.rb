module InstrumentSessionsHelper
  def item_usages_column(record)
    name = record.item_usages.size if record.item_usages.size > 0
  end
  
  def page_usages_column(record)
    name = record.page_usages.size if record.page_usages.size > 0
  end    
end
