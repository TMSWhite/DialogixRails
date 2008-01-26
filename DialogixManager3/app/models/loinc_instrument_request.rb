class LoincInstrumentRequest < ActiveRecord::Base
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  has_many :instrument_versions, :through => :loinc_instrument_requests
  validates_length_of :loinc_system, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_scale, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_property, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_method, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_num, :allow_nil => true, :maximum => 255
  validates_length_of :loinc_time_aspect, :allow_nil => true, :maximum => 255
end
