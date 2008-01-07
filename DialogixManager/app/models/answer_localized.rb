class AnswerLocalized < ActiveRecord::Base
  belongs_to :answer_localized, :class_name => 'AnswerLocalized', :foreign_key => :answer_localized_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :answer_localizeds, :class_name => 'AnswerLocalized', :foreign_key => :answer_localized_id
  has_many :answers, :through => :answer_localizeds
  validates_presence_of :AnswerLength
  validates_numericality_of :AnswerLength, :allow_nil => false, :only_integer => true
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 2
end
