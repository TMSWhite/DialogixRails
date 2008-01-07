class InstrumentVersion < ActiveRecord::Base
  belongs_to :instrument_hash, :class_name => 'InstrumentHash', :foreign_key => :instrument_hash_id
  belongs_to :instrument, :class_name => 'Instrument', :foreign_key => :instrument_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :instrument_version_id
  has_many :instrument_headers, :class_name => 'InstrumentHeader', :foreign_key => :instrument_version_id
  has_many :instrument_load_errors, :class_name => 'InstrumentLoadError', :foreign_key => :instrument_version_id
  has_many :instrument_sessions, :class_name => 'InstrumentSession', :foreign_key => :instrument_version_id
  has_many :loinc_instrument_requests, :class_name => 'LoincInstrumentRequest', :foreign_key => :instrument_version_id
  validates_length_of :LOINC_NUM, :allow_nil => true, :maximum => 255
  validates_presence_of :CreationTimeStamp
  validates_presence_of :VersionString
  validates_length_of :VersionString, :allow_nil => false, :maximum => 255
  validates_numericality_of :InstrumentStatus, :allow_nil => true, :only_integer => true
  validates_inclusion_of :hasLOINCcode, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  
  def to_label
    "#{self.VersionSting}"    
  end
end
