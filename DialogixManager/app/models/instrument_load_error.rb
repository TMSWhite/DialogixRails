class InstrumentLoadError < ActiveRecord::Base
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  validates_numericality_of :sourceColumn, :allow_nil => true, :only_integer => true
  validates_numericality_of :sourceRow, :allow_nil => true, :only_integer => true
  validates_numericality_of :logLevel, :allow_nil => true, :only_integer => true
end
