class V1DataElement < ActiveRecord::Base
  belongs_to :v1_data_element, :class_name => 'V1DataElement', :foreign_key => :v1_data_element_id
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession', :foreign_key => :v1_instrument_session_id
  has_many :v1_data_elements, :class_name => 'V1DataElement', :foreign_key => :v1_data_element_id
  has_many :v1_item_usages, :class_name => 'V1ItemUsage', :foreign_key => :v1_data_element_id
  has_many :v1_instrument_sessions, :through => :v1_data_elements
  has_many :v1_item_usages, :through => :v1_item_usages
  validates_numericality_of :group_num, :allow_nil => true, :only_integer => true
  validates_numericality_of :item_visits, :allow_nil => true, :only_integer => true
  validates_presence_of :data_element_sequence
  validates_numericality_of :data_element_sequence, :allow_nil => false, :only_integer => true
  validates_presence_of :var_name
  validates_length_of :var_name, :allow_nil => false, :maximum => 200
end
