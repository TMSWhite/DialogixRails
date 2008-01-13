class NullFlavor < ActiveRecord::Base
  belongs_to :null_flavor, :class_name => 'NullFlavor', :foreign_key => :null_flavor_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :null_flavor_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :null_flavor_id
  has_many :null_flavors, :class_name => 'NullFlavor', :foreign_key => :null_flavor_id
  has_many :var_names, :through => :data_elements
  has_many :instrument_sessions, :through => :data_elements
  has_many :answers, :through => :data_elements
  has_many :instrument_contents, :through => :data_elements
  has_many :data_elements, :through => :data_elements
  has_many :var_names, :through => :item_usages
  has_many :item_usages, :through => :item_usages
  has_many :instrument_sessions, :through => :item_usages
  has_many :answers, :through => :item_usages
  has_many :instrument_contents, :through => :item_usages
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :display_name
  validates_length_of :display_name, :allow_nil => false, :maximum => 255
end
