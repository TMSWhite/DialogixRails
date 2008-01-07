class Item < ActiveRecord::Base
  belongs_to :item, :class_name => 'Item', :foreign_key => :item_id
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  belongs_to :data_type, :class_name => 'DataType', :foreign_key => :data_type_id
  belongs_to :validation, :class_name => 'Validation', :foreign_key => :validation_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :item_id
  has_many :items, :class_name => 'Item', :foreign_key => :item_id
  has_many :loinc_item_requests, :class_name => 'LoincItemRequest', :foreign_key => :item_id
  has_many :readbacks, :through => :instrument_contents
  has_many :var_names, :through => :instrument_contents
  has_many :display_types, :through => :instrument_contents
  has_many :helps, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
  has_many :validations, :through => :items
  has_many :questions, :through => :items
  has_many :data_types, :through => :items
  has_many :answer_lists, :through => :items
  has_many :loinc_item_requests, :through => :loinc_item_requests
  validates_presence_of :ItemType
  validates_length_of :ItemType, :allow_nil => false, :maximum => 255
  validates_inclusion_of :hasLOINCcode, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :LOINC_NUM, :allow_nil => true, :maximum => 255
end
