class InstrumentVersion < ActiveRecord::Base
  belongs_to :instrument, :class_name => 'Instrument'
  belongs_to :instrument_hash, :class_name => 'InstrumentHash'
  has_many :instrument_contents, :class_name => 'InstrumentContent'
  has_many :instrument_headers, :class_name => 'InstrumentHeader'
  has_many :instrument_load_errors, :class_name => 'InstrumentLoadError'
  has_many :instrument_sessions, :class_name => 'InstrumentSession'
  has_many :loinc_instrument_requests, :class_name => 'LoincInstrumentRequest'
  has_many :items, :through => :instrument_contents
  validates_length_of :loinc_num, :allow_nil => true, :maximum => 255
  validates_presence_of :creation_time_stamp
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_numericality_of :instrument_status, :allow_nil => true, :only_integer => true
  validates_inclusion_of :has_loinc_code, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
end
