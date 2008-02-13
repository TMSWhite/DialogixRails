class V1DataElement < ActiveRecord::Base
  belongs_to :v1_instrument_session, :class_name => 'V1InstrumentSession'
  has_many :v1_item_usages, :class_name => 'V1ItemUsage'
  validates_numericality_of :group_num, :allow_nil => true, :only_integer => true
  validates_numericality_of :item_visits, :allow_nil => true, :only_integer => true
  validates_presence_of :data_element_sequence
  validates_numericality_of :data_element_sequence, :allow_nil => false, :only_integer => true
  validates_presence_of :var_name
  validates_length_of :var_name, :allow_nil => false, :maximum => 200
  
  def to_label
    "#{var_name}"    
  end  
end
