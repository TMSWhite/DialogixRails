class PageUsage < ActiveRecord::Base
  belongs_to :instrument_session, :class_name => 'InstrumentSession'
  belongs_to :action_type, :class_name => 'ActionType'
  has_many :page_usage_events, :class_name => 'PageUsageEvent'
  validates_numericality_of :page_duration, :allow_nil => true, :only_integer => true
  validates_numericality_of :server_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :page_usage_sequence
  validates_numericality_of :page_usage_sequence, :allow_nil => false, :only_integer => true
  validates_numericality_of :load_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :time_stamp
  validates_numericality_of :network_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :to_group_num
  validates_numericality_of :to_group_num, :allow_nil => false, :only_integer => true
  validates_numericality_of :page_visits, :allow_nil => true, :only_integer => true
  validates_length_of :status_msg, :allow_nil => true, :maximum => 255
  validates_numericality_of :used_jvm_memory, :allow_nil => true, :only_integer => true
  validates_length_of :ip_address, :allow_nil => true, :maximum => 255
  validates_presence_of :from_group_num
  validates_numericality_of :from_group_num, :allow_nil => false, :only_integer => true
  validates_length_of :browser, :allow_nil => true, :maximum => 255
  validates_numericality_of :total_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :display_num
  validates_numericality_of :display_num, :allow_nil => false, :only_integer => true
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
  
  def to_label
    "#{page_usage_sequence}"    
  end  
end
