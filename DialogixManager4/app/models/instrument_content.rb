class InstrumentContent < ActiveRecord::Base
  belongs_to :item, :class_name => 'Item'
  belongs_to :display_type, :class_name => 'DisplayType'
  belongs_to :help, :class_name => 'Help'
  belongs_to :instrument_version, :class_name => 'InstrumentVersion'
  belongs_to :var_name, :class_name => 'VarName'
  belongs_to :readback, :class_name => 'Readback'  
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :instrument_content_id
  #has_one :question_localized, :through => :item
  validates_length_of :spss_format, :allow_nil => true, :maximum => 255
  validates_length_of :sas_informat, :allow_nil => true, :maximum => 255
  validates_presence_of :is_read_only
  validates_numericality_of :is_read_only, :allow_nil => false, :only_integer => true
  validates_length_of :sas_format, :allow_nil => true, :maximum => 255
  validates_presence_of :group_num
  validates_numericality_of :group_num, :allow_nil => false, :only_integer => true
  validates_presence_of :item_sequence
  validates_numericality_of :item_sequence, :allow_nil => false, :only_integer => true
  validates_length_of :item_action_type, :allow_nil => true, :maximum => 255
  validates_presence_of :is_required
  validates_numericality_of :is_required, :allow_nil => false, :only_integer => true
  validates_presence_of :is_message
  validates_numericality_of :is_message, :allow_nil => false, :only_integer => true
  validates_presence_of :relevance
  
  
end
