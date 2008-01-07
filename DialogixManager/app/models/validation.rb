class Validation < ActiveRecord::Base
  belongs_to :validation, :class_name => 'Validation', :foreign_key => :validation_id
  belongs_to :data_type, :class_name => 'DataType', :foreign_key => :data_type_id
  has_many :items, :class_name => 'Item', :foreign_key => :validation_id
  has_many :validations, :class_name => 'Validation', :foreign_key => :validation_id
  has_many :items, :through => :items
  has_many :questions, :through => :items
  has_many :data_types, :through => :items
  has_many :answer_lists, :through => :items
  has_many :data_types, :through => :validations
  validates_length_of :OtherVals, :allow_nil => true, :maximum => 255
  validates_length_of :InputMask, :allow_nil => true, :maximum => 255
  validates_length_of :MaxVal, :allow_nil => true, :maximum => 255
  validates_length_of :MinVal, :allow_nil => true, :maximum => 255
end
