class DataElement < ActiveRecord::Base
  belongs_to :data_element, :class_name => 'DataElement', :foreign_key => :data_element_id
  belongs_to :null_flavor, :class_name => 'NullFlavor', :foreign_key => :null_flavor_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  belongs_to :instrument_content, :class_name => 'InstrumentContent', :foreign_key => :instrument_content_id
  belongs_to :instrument_session, :class_name => 'InstrumentSession', :foreign_key => :instrument_session_id
  belongs_to :var_name, :class_name => 'VarName', :foreign_key => :var_name_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :data_element_id
  has_many :var_names, :through => :data_elements
  has_many :instrument_sessions, :through => :data_elements
  has_many :answers, :through => :data_elements
  has_many :instrument_contents, :through => :data_elements
  has_many :null_flavors, :through => :data_elements
  validates_numericality_of :GroupNum, :allow_nil => true, :only_integer => true
  validates_presence_of :WhenAsMS
  validates_numericality_of :WhenAsMS, :allow_nil => false, :only_integer => true
  validates_presence_of :DisplayNum
  validates_numericality_of :DisplayNum, :allow_nil => false, :only_integer => true
  validates_numericality_of :itemVisits, :allow_nil => true, :only_integer => true
  validates_numericality_of :responseLatency, :allow_nil => true, :only_integer => true
  validates_length_of :LanguageCode, :allow_nil => true, :maximum => 2
  validates_numericality_of :responseDuration, :allow_nil => true, :only_integer => true
  validates_presence_of :DataElementSequence
  validates_numericality_of :DataElementSequence, :allow_nil => false, :only_integer => true
end
