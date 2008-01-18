class Instrument < ActiveRecord::Base
  has_many :instrument_versions, :class_name => 'InstrumentVersion', :foreign_key => :instrument_id
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
end
