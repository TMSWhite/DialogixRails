class Instrument < ActiveRecord::Base
  has_many :instrument_versions, :class_name => 'InstrumentVersion', :foreign_key => :instrument_id
  validates_presence_of :InstrumentName
  validates_length_of :InstrumentName, :allow_nil => false, :maximum => 255  
end
