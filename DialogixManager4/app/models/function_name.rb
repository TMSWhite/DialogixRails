class FunctionName < ActiveRecord::Base
  belongs_to :function_name, :class_name => 'FunctionName'
  has_many :function_names, :class_name => 'FunctionName'
  validates_presence_of :syntax
  validates_presence_of :description
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :definition
end
