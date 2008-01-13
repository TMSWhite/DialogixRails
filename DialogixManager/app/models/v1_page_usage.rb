class V1PageUsage < ActiveRecord::Base
  belongs_to :v1_page_usage, :class_name => 'V1PageUsage', :foreign_key => :v1_page_usage_id
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_page_usages, :class_name => 'V1PageUsage', :foreign_key => :v1_page_usage_id
  has_many :v1_instrument_sessions, :through => :v1_page_usages
  validates_numericality_of :server_duration, :allow_nil => true, :only_integer => true
  validates_numericality_of :load_duration, :allow_nil => true, :only_integer => true
  validates_presence_of :display_num
  validates_numericality_of :display_num, :allow_nil => false, :only_integer => true
  validates_numericality_of :network_duration, :allow_nil => true, :only_integer => true
  validates_numericality_of :page_duration, :allow_nil => true, :only_integer => true
  validates_length_of :language_code, :allow_nil => true, :maximum => 2
  validates_numericality_of :total_duration, :allow_nil => true, :only_integer => true
  validates_length_of :action_type, :allow_nil => true, :maximum => 255
end
