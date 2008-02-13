class DataElement < ActiveRecord::Base
  belongs_to :data_element, :class_name => 'DataElement'
  belongs_to :null_flavor, :class_name => 'NullFlavor'
  belongs_to :answer, :class_name => 'Answer'
  belongs_to :instrument_session, :class_name => 'InstrumentSession'
  belongs_to :instrument_content, :class_name => 'InstrumentContent'
  belongs_to :var_name, :class_name => 'VarName'
  has_many :data_elements, :class_name => 'DataElement'
  has_many :var_names, :through => :data_elements
  has_many :instrument_sessions, :through => :data_elements
  has_many :answers, :through => :data_elements
  has_many :instrument_contents, :through => :data_elements
  has_many :null_flavors, :through => :data_elements
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
