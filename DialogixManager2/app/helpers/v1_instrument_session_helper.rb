module V1InstrumentSessionHelper
  def v1_data_elements_column(record)
    name = record.v1_data_elements.size if record.v1_data_elements.size > 0
  end

  def v1_item_usages_column(record)
    name = record.v1_item_usages.size if record.v1_item_usages.size > 0
  end

  def v1_page_usages_column(record)
    name = record.v1_page_usages.size if record.v1_page_usages.size > 0
  end
end
