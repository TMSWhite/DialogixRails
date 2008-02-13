class ActionType < ActiveRecord::Base
  belongs_to :action_type, :class_name => 'ActionType'
  has_many :action_types, :class_name => 'ActionType'
  has_many :instrument_sessions, :class_name => 'InstrumentSession'
  has_many :page_usages, :class_name => 'PageUsage'
  has_many :dialogix_users, :through => :instrument_sessions
  has_many :instruments, :through => :instrument_sessions
  has_many :instrument_sessions, :through => :instrument_sessions
  has_many :instrument_versions, :through => :instrument_sessions
  has_many :instrument_sessions, :through => :page_usages
  has_many :page_usages, :through => :page_usages
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
end
