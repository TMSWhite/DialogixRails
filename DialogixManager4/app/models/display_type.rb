class DisplayType < ActiveRecord::Base
  belongs_to :data_type, :class_name => 'DataType'
  has_many :instrument_contents, :class_name => 'InstrumentContent'
  has_many :entry_items, :class_name => 'EntryItem'
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
