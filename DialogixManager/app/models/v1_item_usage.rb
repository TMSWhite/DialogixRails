class V1ItemUsage < ActiveRecord::Base
  belongs_to :v1_item_usage, :class_name => 'V1ItemUsage', :foreign_key => :v1_item_usage_id
  belongs_to :v1_data_element, :class_name => 'V1DataElement', :foreign_key => :v1_data_element_id
  has_many :v1_item_usages, :class_name => 'V1ItemUsage', :foreign_key => :v1_item_usage_id
  has_many :v1_data_elements, :through => :v1_item_usages
  validates_presence_of :display_num
  validates_numericality_of :display_num, :allow_nil => false, :only_integer => true
  validates_numericality_of :when_as_ms, :allow_nil => true, :only_integer => true
  validates_numericality_of :item_visits, :allow_nil => true, :only_integer => true
  validates_length_of :language_code, :allow_nil => true, :maximum => 2
  validates_presence_of :item_usage_sequence
  validates_numericality_of :item_usage_sequence, :allow_nil => false, :only_integer => true
end
