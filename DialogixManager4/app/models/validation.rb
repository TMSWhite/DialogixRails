class Validation < ActiveRecord::Base
  belongs_to :validation, :class_name => 'Validation'
  belongs_to :data_type, :class_name => 'DataType'
  has_many :items, :class_name => 'Item'
  has_many :validations, :class_name => 'Validation'
  has_many :items, :through => :items
  has_many :questions, :through => :items
  has_many :data_types, :through => :items
  has_many :answer_lists, :through => :items
  has_many :data_types, :through => :validations
  validates_length_of :other_vals, :allow_nil => true, :maximum => 255
  validates_length_of :input_mask, :allow_nil => true, :maximum => 255
  validates_length_of :max_val, :allow_nil => true, :maximum => 255
  validates_length_of :min_val, :allow_nil => true, :maximum => 255
  
  def to_label
    "(#{min_val} - #{max_val}) or (#{other_vals})"    
  end
  
end
