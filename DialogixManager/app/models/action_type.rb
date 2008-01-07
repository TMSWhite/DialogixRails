class ActionType < ActiveRecord::Base
  belongs_to :action_type, :class_name => 'ActionType', :foreign_key => :action_type_id
  has_many :action_types, :class_name => 'ActionType', :foreign_key => :action_type_id
  has_many :instrument_sessions, :class_name => 'InstrumentSession', :foreign_key => :action_type_id
  has_many :page_usages, :class_name => 'PageUsage', :foreign_key => :action_type_id
  has_many :dialogix_users, :through => :instrument_sessions
  has_many :instruments, :through => :instrument_sessions
  has_many :instrument_sessions, :through => :instrument_sessions
  has_many :instrument_versions, :through => :instrument_sessions
  has_many :instrument_sessions, :through => :page_usages
  has_many :page_usages, :through => :page_usages
  validates_presence_of :ActionName
  validates_length_of :ActionName, :allow_nil => false, :maximum => 255
end
