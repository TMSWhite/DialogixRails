class InstrumentHeader < ActiveRecord::Base
  belongs_to :instrument_header, :class_name => 'InstrumentHeader'
  belongs_to :instrument_version, :class_name => 'InstrumentVersion'
  belongs_to :reserved_word, :class_name => 'ReservedWord'
  has_many :instrument_headers, :class_name => 'InstrumentHeader'
  has_many :reserved_words, :through => :instrument_headers
  has_many :instrument_versions, :through => :instrument_headers
  validates_presence_of :name
end
