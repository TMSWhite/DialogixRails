class PageUsage < ActiveRecord::Base
  belongs_to :instrument_session, :class_name => 'InstrumentSession', :foreign_key => :instrument_session_id
  has_many :page_usage_events, :class_name => 'PageUsageEvent', :foreign_key => :page_usage_id
  validates_numericality_of :pageDuration, :allow_nil => true, :only_integer => true
  validates_numericality_of :serverDuration, :allow_nil => true, :only_integer => true
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 2
  validates_numericality_of :loadDuration, :allow_nil => true, :only_integer => true
  validates_presence_of :FromGroupNum
  validates_numericality_of :FromGroupNum, :allow_nil => false, :only_integer => true
  validates_numericality_of :networkDuration, :allow_nil => true, :only_integer => true
  validates_presence_of :DisplayNum
  validates_numericality_of :DisplayNum, :allow_nil => false, :only_integer => true
  validates_numericality_of :pageVisits, :allow_nil => true, :only_integer => true
  validates_numericality_of :totalDuration, :allow_nil => true, :only_integer => true
  validates_length_of :IPAddress, :allow_nil => true, :maximum => 255
  validates_presence_of :Time_Stamp
  validates_length_of :Browser, :allow_nil => true, :maximum => 255
  validates_length_of :StatusMsg, :allow_nil => true, :maximum => 255
  validates_presence_of :ToGroupNum
  validates_numericality_of :ToGroupNum, :allow_nil => false, :only_integer => true
  validates_presence_of :PageUsageSequence
  validates_numericality_of :PageUsageSequence, :allow_nil => false, :only_integer => true
end
