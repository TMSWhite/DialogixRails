class LoincItemRequest < ActiveRecord::Base
  belongs_to :loinc_item_request, :class_name => 'LoincItemRequest'
  belongs_to :item, :class_name => 'Item'
  has_many :loinc_item_requests, :class_name => 'LoincItemRequest'
  has_many :items, :through => :loinc_item_requests
  validates_length_of :loinc_system, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_scale, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_property, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_method, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_num, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_time_aspect, :allow_nil => true, :maximum => 255
end
