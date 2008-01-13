class InstrumentSession < ActiveRecord::Base
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  belongs_to :dialogix_user, :class_name => 'DialogixUser', :foreign_key => :dialogix_user_id
  belongs_to :action_type, :class_name => 'ActionType', :foreign_key => :action_type_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :instrument_session_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :instrument_session_id
  has_many :page_usages, :class_name => 'PageUsage', :foreign_key => :instrument_session_id
  validates_numericality_of :finished, :allow_nil => true, :only_integer => true
  validates_numericality_of :num_vars, :allow_nil => true, :only_integer => true
  validates_presence_of :start_time
  validates_numericality_of :num_groups, :allow_nil => true, :only_integer => true
  validates_presence_of :instrument_starting_group
  validates_numericality_of :instrument_starting_group, :allow_nil => false, :only_integer => true
  validates_presence_of :current_var_name
  validates_numericality_of :current_var_name, :allow_nil => false, :only_integer => true
  validates_length_of :ip_address, :allow_nil => true, :maximum => 255
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 255
  validates_length_of :browser, :allow_nil => true, :maximum => 255
  validates_numericality_of :max_group, :allow_nil => true, :only_integer => true
  validates_presence_of :current_group
  validates_numericality_of :current_group, :allow_nil => false, :only_integer => true
  validates_presence_of :display_num
  validates_numericality_of :display_num, :allow_nil => false, :only_integer => true
  validates_presence_of :last_access_time
  validates_length_of :status_msg, :allow_nil => true, :maximum => 255
  validates_numericality_of :max_var_num, :allow_nil => true, :only_integer => true
  
  def to_label
    "#{start_time}"    
  end
  
end
