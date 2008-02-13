class Answer < ActiveRecord::Base
  has_many :answer_list_contents, :class_name => 'AnswerListContent'
  has_many :answer_localizeds, :class_name => 'AnswerLocalized'
  has_many :data_elements, :class_name => 'DataElement'
  has_many :item_usages, :class_name => 'ItemUsage'
#  has_many :answer_lists, :through => :answer_list_contents
#  has_many :instrument_sessions, :through => :item_usages
#  has_many :instrument_contents, :through => :item_usages
#  has_many :null_flavors, :through => :item_usages
  validates_inclusion_of :has_la_code, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :la_code, :allow_nil => true, :maximum => 255
end
