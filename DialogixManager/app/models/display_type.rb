class DisplayType < ActiveRecord::Base
  belongs_to :display_type, :class_name => 'DisplayType', :foreign_key => :display_type_id
  belongs_to :data_type, :class_name => 'DataType', :foreign_key => :data_type_id
  has_many :display_types, :class_name => 'DisplayType', :foreign_key => :display_type_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :display_type_id
  has_many :data_types, :through => :display_types
  has_many :readbacks, :through => :instrument_contents
  has_many :items, :through => :instrument_contents
  has_many :var_names, :through => :instrument_contents
  has_many :helps, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
  validates_presence_of :SASinformat
  validates_length_of :SASinformat, :allow_nil => false, :maximum => 255
  validates_presence_of :SASformat
  validates_length_of :SASformat, :allow_nil => false, :maximum => 255
  validates_presence_of :DisplayType
  validates_length_of :DisplayType, :allow_nil => false, :maximum => 255
  validates_presence_of :SPSSlevel
  validates_length_of :SPSSlevel, :allow_nil => false, :maximum => 255
  validates_presence_of :SPSSformat
  validates_length_of :SPSSformat, :allow_nil => false, :maximum => 255
  validates_presence_of :LOINCscale
  validates_length_of :LOINCscale, :allow_nil => false, :maximum => 255
  validates_inclusion_of :HasAnswerList, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
end
