class ReservedWord < ActiveRecord::Base
  belongs_to :reserved_word, :class_name => 'ReservedWord', :foreign_key => :reserved_word_id
  has_many :instrument_headers, :class_name => 'InstrumentHeader', :foreign_key => :reserved_word_id
  has_many :reserved_words, :class_name => 'ReservedWord', :foreign_key => :reserved_word_id
  has_many :instrument_versions, :through => :instrument_headers
  has_many :instrument_headers, :through => :instrument_headers
  validates_presence_of :ReservedWord
  validates_length_of :ReservedWord, :allow_nil => false, :maximum => 255
  validates_length_of :Meaning, :allow_nil => true, :maximum => 255
end
