class QuestionLocalized < ActiveRecord::Base
  belongs_to :question_localized, :class_name => 'QuestionLocalized', :foreign_key => :question_localized_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  has_many :question_localizeds, :class_name => 'QuestionLocalized', :foreign_key => :question_localized_id
  has_many :questions, :through => :question_localizeds
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
  validates_presence_of :question_length
  validates_numericality_of :question_length, :allow_nil => false, :only_integer => true
end
