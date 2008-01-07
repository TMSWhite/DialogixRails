class AnswerListDenormalized < ActiveRecord::Base
  belongs_to :answer_list_denormalized, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_denormalized_id
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :answer_list_denormalizeds, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_denormalized_id
  has_many :answer_lists, :through => :answer_list_denormalizeds
  validates_presence_of :AnswerListDenormalizedLength
  validates_numericality_of :AnswerListDenormalizedLength, :allow_nil => false, :only_integer => true
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 2
  validates_presence_of :AnswerListDenormalizedString
end
