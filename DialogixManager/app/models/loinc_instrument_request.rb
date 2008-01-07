class LoincInstrumentRequest < ActiveRecord::Base
  belongs_to :loinc_instrument_request, :class_name => 'LoincInstrumentRequest', :foreign_key => :loinc_instrument_request_id
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  has_many :loinc_instrument_requests, :class_name => 'LoincInstrumentRequest', :foreign_key => :loinc_instrument_request_id
  has_many :instrument_versions, :through => :loinc_instrument_requests
  validates_length_of :LOINCsystem, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCscale, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCproperty, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCmethod, :allow_nil => true, :maximum => 255
  validates_length_of :LOINC_NUM, :allow_nil => true, :maximum => 255
  validates_length_of :LOINCtimeAspect, :allow_nil => true, :maximum => 255
end
