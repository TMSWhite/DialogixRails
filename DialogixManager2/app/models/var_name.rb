class VarName < ActiveRecord::Base
  belongs_to :var_name, :class_name => 'VarName', :foreign_key => :var_name_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :var_name_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :var_name_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :var_name_id
  has_many :var_names, :class_name => 'VarName', :foreign_key => :var_name_id
  has_many :instrument_sessions, :through => :data_elements
  has_many :answers, :through => :data_elements
  has_many :instrument_contents, :through => :data_elements
  has_many :null_flavors, :through => :data_elements
  has_many :data_elements, :through => :data_elements
  has_many :readbacks, :through => :instrument_contents
  has_many :items, :through => :instrument_contents
  has_many :helps, :through => :instrument_contents
  has_many :display_types, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
  has_many :item_usages, :through => :item_usages
  has_many :instrument_sessions, :through => :item_usages
  has_many :answers, :through => :item_usages
  has_many :instrument_contents, :through => :item_usages
  has_many :null_flavors, :through => :item_usages
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
end
