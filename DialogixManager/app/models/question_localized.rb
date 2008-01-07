class QuestionLocalized < ActiveRecord::Base
  belongs_to :question_localized, :class_name => 'QuestionLocalized', :foreign_key => :question_localized_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  has_many :question_localizeds, :class_name => 'QuestionLocalized', :foreign_key => :question_localized_id
  has_many :questions, :through => :question_localizeds
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 2
  validates_presence_of :questionLength
  validates_numericality_of :questionLength, :allow_nil => false, :only_integer => true
end
