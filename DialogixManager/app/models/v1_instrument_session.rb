class V1InstrumentSession < ActiveRecord::Base
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :class_name => 'V1DataElement', :foreign_key => :v1_instrument_session_id
  has_many :v1_instrument_sessions, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_item_usages, :class_name => 'V1ItemUsage', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :through => :v1_data_elements
  has_many :v1_item_usages, :through => :v1_item_usages
  validates_numericality_of :MaxGroup, :allow_nil => true, :only_integer => true
  validates_numericality_of :MaxVarNum, :allow_nil => true, :only_integer => true
  validates_presence_of :InstrumentVersionName
  validates_length_of :InstrumentVersionName, :allow_nil => false, :maximum => 255
  validates_presence_of :LastAccessTime
  validates_numericality_of :CurrentGroup, :allow_nil => true, :only_integer => true
  validates_numericality_of :NumVars, :allow_nil => true, :only_integer => true
  validates_length_of :LanguageCode, :allow_nil => true, :maximum => 2
  validates_length_of :VarListMD5, :allow_nil => true, :maximum => 255
  validates_length_of :StatusMsg, :allow_nil => true, :maximum => 255
  validates_numericality_of :NumGroups, :allow_nil => true, :only_integer => true
  validates_presence_of :StartTime
  validates_numericality_of :Finished, :allow_nil => true, :only_integer => true
  validates_numericality_of :DisplayNum, :allow_nil => true, :only_integer => true
  validates_length_of :IPAddress, :allow_nil => true, :maximum => 255
  validates_length_of :Browser, :allow_nil => true, :maximum => 255
  validates_length_of :ActionType, :allow_nil => true, :maximum => 255
  validates_numericality_of :InstrumentStartingGroup, :allow_nil => true, :only_integer => true
end
