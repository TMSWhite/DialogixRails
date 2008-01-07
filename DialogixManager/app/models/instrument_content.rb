class InstrumentContent < ActiveRecord::Base
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :instrument_content_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :instrument_content_id
  validates_length_of :SPSSformat, :allow_nil => true, :maximum => 255
  validates_length_of :SASinformat, :allow_nil => true, :maximum => 255
  validates_presence_of :isReadOnly
  validates_numericality_of :isReadOnly, :allow_nil => false, :only_integer => true
  validates_length_of :SASformat, :allow_nil => true, :maximum => 255
  validates_presence_of :GroupNum
  validates_numericality_of :GroupNum, :allow_nil => false, :only_integer => true
  validates_presence_of :ItemSequence
  validates_numericality_of :ItemSequence, :allow_nil => false, :only_integer => true
  validates_length_of :ItemActionType, :allow_nil => true, :maximum => 255
  validates_presence_of :isRequired
  validates_numericality_of :isRequired, :allow_nil => false, :only_integer => true
  validates_presence_of :isMessage
  validates_numericality_of :isMessage, :allow_nil => false, :only_integer => true
  validates_presence_of :Relevance
end
