class InstrumentSession < ActiveRecord::Base
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :instrument_session_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :instrument_session_id
  has_many :page_usages, :class_name => 'PageUsage', :foreign_key => :instrument_session_id
  validates_numericality_of :Finished, :allow_nil => true, :only_integer => true
  validates_numericality_of :NumVars, :allow_nil => true, :only_integer => true
  validates_presence_of :StartTime
  validates_numericality_of :NumGroups, :allow_nil => true, :only_integer => true
  validates_presence_of :InstrumentStartingGroup
  validates_numericality_of :InstrumentStartingGroup, :allow_nil => false, :only_integer => true
  validates_presence_of :CurrentVarNum
  validates_numericality_of :CurrentVarNum, :allow_nil => false, :only_integer => true
  validates_length_of :IPAddress, :allow_nil => true, :maximum => 255
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 255
  validates_length_of :Browser, :allow_nil => true, :maximum => 255
  validates_numericality_of :MaxGroup, :allow_nil => true, :only_integer => true
  validates_presence_of :CurrentGroup
  validates_numericality_of :CurrentGroup, :allow_nil => false, :only_integer => true
  validates_presence_of :DisplayNum
  validates_numericality_of :DisplayNum, :allow_nil => false, :only_integer => true
  validates_presence_of :LastAccessTime
  validates_length_of :StatusMsg, :allow_nil => true, :maximum => 255
  validates_numericality_of :MaxVarNum, :allow_nil => true, :only_integer => true
  
  def to_label
    "#{InstrumentSession}"    
  end
end
