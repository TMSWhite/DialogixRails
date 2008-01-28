class Sequence < ActiveRecord::Base
  validates_presence_of :seq_name
  validates_length_of :seq_name, :allow_nil => false, :maximum => 50
  validates_numericality_of :seq_count, :allow_nil => true, :only_integer => true
end
