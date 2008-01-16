module V1DataElementHelper
  def v1_item_usages_column(record)
    name = record.v1_item_usages.size if record.v1_item_usages.size > 0
  end
end
