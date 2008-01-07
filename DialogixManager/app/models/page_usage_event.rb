class PageUsageEvent < ActiveRecord::Base
  belongs_to :page_usage, :class_name => 'PageUsage', :foreign_key => :page_usage_id
  validates_presence_of :duration
  validates_numericality_of :duration, :allow_nil => false, :only_integer => true
  validates_presence_of :PageUsageEventSequence
  validates_numericality_of :PageUsageEventSequence, :allow_nil => false, :only_integer => true
  validates_presence_of :value1
  validates_length_of :value1, :allow_nil => false, :maximum => 255
  validates_presence_of :eventType
  validates_length_of :eventType, :allow_nil => false, :maximum => 255
  validates_presence_of :value2
  validates_length_of :value2, :allow_nil => false, :maximum => 255
  validates_presence_of :GuiActionType
  validates_length_of :GuiActionType, :allow_nil => false, :maximum => 255
  validates_presence_of :VarName
  validates_length_of :VarName, :allow_nil => false, :maximum => 255
end
