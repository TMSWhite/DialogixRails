class V1DataElement < ActiveRecord::Base
  belongs_to :v1_data_element, :class_name => 'V1DataElement', :foreign_key => :v1_data_element_id
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :class_name => 'V1DataElement', :foreign_key => :v1_data_element_id
  has_many :v1_instrument_sessions, :through => :v1_data_elements
  validates_presence_of :WhenAsMS
  validates_numericality_of :WhenAsMS, :allow_nil => false, :only_integer => true
  validates_presence_of :DataElementSequence
  validates_numericality_of :DataElementSequence, :allow_nil => false, :only_integer => true
  validates_numericality_of :itemVisits, :allow_nil => true, :only_integer => true
  validates_presence_of :DisplayNum
  validates_numericality_of :DisplayNum, :allow_nil => false, :only_integer => true
  validates_numericality_of :totalDuration, :allow_nil => true, :only_integer => true
  validates_numericality_of :pageDuration, :allow_nil => true, :only_integer => true
  validates_numericality_of :serverDuration, :allow_nil => true, :only_integer => true
  validates_numericality_of :GroupNum, :allow_nil => true, :only_integer => true
  validates_numericality_of :loadDuration, :allow_nil => true, :only_integer => true
  validates_numericality_of :networkDuration, :allow_nil => true, :only_integer => true
  validates_length_of :LanguageCode, :allow_nil => true, :maximum => 2
  validates_presence_of :VarName
  validates_length_of :VarName, :allow_nil => false, :maximum => 200
end
