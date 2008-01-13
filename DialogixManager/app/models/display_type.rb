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
  validates_presence_of :sas_informat
  validates_length_of :sas_informat, :allow_nil => false, :maximum => 255
  validates_presence_of :sas_format
  validates_length_of :sas_format, :allow_nil => false, :maximum => 255
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :spss_level
  validates_length_of :spss_level, :allow_nil => false, :maximum => 255
  validates_presence_of :spss_format
  validates_length_of :spss_format, :allow_nil => false, :maximum => 255
  validates_presence_of :loinc_scale
  validates_length_of :loinc_scale, :allow_nil => false, :maximum => 255
  validates_inclusion_of :has_answer_list, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
end
