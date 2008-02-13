class ItemUsage < ActiveRecord::Base
  belongs_to :null_flavor, :class_name => 'NullFlavor'
  belongs_to :answer, :class_name => 'Answer'
  belongs_to :instrument_session, :class_name => 'InstrumentSession'
  belongs_to :instrument_content, :class_name => 'InstrumentContent'
  belongs_to :var_name, :class_name => 'VarName'
  validates_presence_of :item_usage_sequence
  validates_numericality_of :item_usage_sequence, :allow_nil => false, :only_integer => true
  validates_numericality_of :group_num, :allow_nil => true, :only_integer => true
  validates_presence_of :when_as_ms
  validates_numericality_of :when_as_ms, :allow_nil => false, :only_integer => true
  validates_presence_of :display_num
  validates_numericality_of :display_num, :allow_nil => false, :only_integer => true
  validates_numericality_of :item_visits, :allow_nil => true, :only_integer => true
  validates_numericality_of :response_latency, :allow_nil => true, :only_integer => true
  validates_length_of :language_code, :allow_nil => true, :maximum => 2
  validates_numericality_of :response_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :data_element_sequence
  validates_numericality_of :data_element_sequence, :allow_nil => false, :only_integer => true
end
