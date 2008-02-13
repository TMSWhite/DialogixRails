class DataType < ActiveRecord::Base
  belongs_to :data_type, :class_name => 'DataType'
  has_many :data_types, :class_name => 'DataType'
  has_many :display_types, :class_name => 'DisplayType'
  has_many :items, :class_name => 'Item'
  has_many :validations, :class_name => 'Validation'
  has_many :display_types, :through => :display_types
  has_many :items, :through => :items
  has_many :validations, :through => :items
  has_many :questions, :through => :items
  has_many :answer_lists, :through => :items
  has_many :validations, :through => :validations
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
end
