class FunctionName < ActiveRecord::Base
  belongs_to :function_name, :class_name => 'FunctionName', :foreign_key => :function_name_id
  has_many :function_names, :class_name => 'FunctionName', :foreign_key => :function_name_id
  validates_presence_of :Syntax
  validates_presence_of :Description
  validates_presence_of :Name
  validates_length_of :Name, :allow_nil => false, :maximum => 255
  validates_presence_of :Definition
end
