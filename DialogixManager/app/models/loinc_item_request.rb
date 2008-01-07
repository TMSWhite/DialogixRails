class LoincItemRequest < ActiveRecord::Base
  belongs_to :loinc_item_request, :class_name => 'LoincItemRequest', :foreign_key => :loinc_item_request_id
  belongs_to :item, :class_name => 'Item', :foreign_key => :item_id
  has_many :loinc_item_requests, :class_name => 'LoincItemRequest', :foreign_key => :loinc_item_request_id
  has_many :items, :through => :loinc_item_requests
  validates_length_of :LOINCsystem, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCscale, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCproperty, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCmethod, :allow_nil => true, :maximum => 255
  validates_length_of :LOINC_NUM, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCtimeAspect, :allow_nil => true, :maximum => 255
end
