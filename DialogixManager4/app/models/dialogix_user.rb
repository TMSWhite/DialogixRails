class DialogixUser < ActiveRecord::Base
  has_many :instrument_sessions, :class_name => 'InstrumentSession'
  has_many :instruments, :through => :instrument_sessions, :source => :instrument_version
  has_many :instrument_versions, :through => :instrument_sessions
  validates_presence_of :first_name
  validates_length_of :first_name, :allow_nil => false, :maximum => 255
  validates_presence_of :last_name
  validates_length_of :last_name, :allow_nil => false, :maximum => 255
  validates_presence_of :user_name
  validates_length_of :user_name, :allow_nil => false, :maximum => 255
  validates_presence_of :email
  validates_length_of :email, :allow_nil => false, :maximum => 255
  validates_presence_of :phone
  validates_length_of :phone, :allow_nil => false, :maximum => 255
  validates_presence_of :pwd
  validates_length_of :pwd, :allow_nil => false, :maximum => 255
  
  def to_label
    "#{user_name}"    
  end
  
end
