class LoincItemRequest < ActiveRecord::Base
  belongs_to :item, :class_name => 'Item', :foreign_key => :item_id
  validates_length_of :LOINCsystem, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCscale, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCproperty, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCmethod, :allow_nil => true, :maximum => 255
  validates_length_of :LOINC_NUM, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCtimeAspect, :allow_nil => true, :maximum => 255
end
