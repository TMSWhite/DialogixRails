class InstrumentLoadError < ActiveRecord::Base
  belongs_to :instrument_load_error, :class_name => 'InstrumentLoadError', :foreign_key => :instrument_load_error_id
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  has_many :instrument_load_errors, :class_name => 'InstrumentLoadError', :foreign_key => :instrument_load_error_id
  has_many :instrument_versions, :through => :instrument_load_errors
  validates_numericality_of :source_column, :allow_nil => true, :only_integer => true
  validates_numericality_of :source_row, :allow_nil => true, :only_integer => true
  validates_numericality_of :log_level, :allow_nil => true, :only_integer => true
end
