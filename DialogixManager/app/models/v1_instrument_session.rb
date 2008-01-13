class V1InstrumentSession < ActiveRecord::Base
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :class_name => 'V1DataElement', :foreign_key => :v1_instrument_session_id
  has_many :v1_instrument_sessions, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_page_usages, :class_name => 'V1PageUsage', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :through => :v1_data_elements
  has_many :v1_page_usages, :through => :v1_page_usages
  validates_numericality_of :max_group, :allow_nil => true, :only_integer => true
  validates_numericality_of :max_var_num, :allow_nil => true, :only_integer => true
  validates_presence_of :instrument_version_name
  validates_length_of :instrument_version_name, :allow_nil => false, :maximum => 255
  validates_presence_of :last_access_time
  validates_numericality_of :current_group, :allow_nil => true, :only_integer => true
  validates_numericality_of :num_vars, :allow_nil => true, :only_integer => true
  validates_length_of :language_code, :allow_nil => true, :maximum => 2
  validates_length_of :var_list_md5, :allow_nil => true, :maximum => 255
  validates_length_of :status_msg, :allow_nil => true, :maximum => 255
  validates_numericality_of :num_groups, :allow_nil => true, :only_integer => true
  validates_presence_of :start_time
  validates_numericality_of :finished, :allow_nil => true, :only_integer => true
  validates_numericality_of :display_num, :allow_nil => true, :only_integer => true
  validates_length_of :ip_address, :allow_nil => true, :maximum => 255
  validates_length_of :browser, :allow_nil => true, :maximum => 255
  validates_length_of :action_type, :allow_nil => true, :maximum => 255
  validates_numericality_of :instrument_starting_group, :allow_nil => true, :only_integer => true
end
