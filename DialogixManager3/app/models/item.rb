class Item < ActiveRecord::Base
  #belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :answer_list_content, :class_name => 'AnswerListContent', :foreign_key => :answer_list_id
  has_many :answer_list_denormalized, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_id
  belongs_to :data_type, :class_name => 'DataType', :foreign_key => :data_type_id
  belongs_to :validation, :class_name => 'Validation', :foreign_key => :validation_id
  has_many :question_localizeds, :class_name => 'QuestionLocalized', :foreign_key => :question_id
  #has_many :answer_localized, :class_name => 'AnswerLocalized', :foreign_key => :answer_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :item_id
  has_many :loinc_item_requests, :class_name => 'LoincItemRequest', :foreign_key => :item_id
  #has_many :answer_localizeds, :through => :answer_list_contents
  validates_presence_of :item_type
  validates_length_of :item_type, :allow_nil => false, :maximum => 255
  validates_inclusion_of :has_loinc_code, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :loinc_num, :allow_nil => true, :maximum => 255
  
  def to_label
    "#{item_type}"    
  end
  
end
