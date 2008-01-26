class InstrumentHeader < ActiveRecord::Base
  belongs_to :instrument_header, :class_name => 'InstrumentHeader', :foreign_key => :instrument_header_id
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  belongs_to :reserved_word, :class_name => 'ReservedWord', :foreign_key => :reserved_word_id
  has_many :instrument_headers, :class_name => 'InstrumentHeader', :foreign_key => :instrument_header_id
  has_many :reserved_words, :through => :instrument_headers
  has_many :instrument_versions, :through => :instrument_headers
  validates_presence_of :name
end
