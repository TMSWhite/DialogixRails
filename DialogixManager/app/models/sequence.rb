class Sequence < ActiveRecord::Base
  validates_presence_of :SEQ_NAME
  validates_length_of :SEQ_NAME, :allow_nil => false, :maximum => 50
  validates_numericality_of :SEQ_COUNT, :allow_nil => true, :only_integer => true
end
