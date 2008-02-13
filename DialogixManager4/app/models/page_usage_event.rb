class PageUsageEvent < ActiveRecord::Base
  belongs_to :page_usage, :class_name => 'PageUsage'
  validates_presence_of :duration
  validates_numericality_of :duration, :allow_nil => false, :only_integer => true
  validates_presence_of :page_usage_event_sequence
  validates_numericality_of :page_usage_event_sequence, :allow_nil => false, :only_integer => true
  validates_presence_of :value1
  validates_length_of :value1, :allow_nil => false, :maximum => 255
  validates_presence_of :event_type
  validates_length_of :event_type, :allow_nil => false, :maximum => 255
  validates_presence_of :value2
  validates_length_of :value2, :allow_nil => false, :maximum => 255
  validates_presence_of :gui_action_type
  validates_length_of :gui_action_type, :allow_nil => false, :maximum => 255
  validates_presence_of :var_name
  validates_length_of :var_name, :allow_nil => false, :maximum => 255
end
