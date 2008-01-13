class DataType < ActiveRecord::Base
  belongs_to :data_type, :class_name => 'DataType', :foreign_key => :data_type_id
  has_many :data_types, :class_name => 'DataType', :foreign_key => :data_type_id
  has_many :display_types, :class_name => 'DisplayType', :foreign_key => :data_type_id
  has_many :items, :class_name => 'Item', :foreign_key => :data_type_id
  has_many :validations, :class_name => 'Validation', :foreign_key => :data_type_id
  has_many :display_types, :through => :display_types
  has_many :items, :through => :items
  has_many :validations, :through => :items
  has_many :questions, :through => :items
  has_many :answer_lists, :through => :items
  has_many :validations, :through => :validations
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
end
