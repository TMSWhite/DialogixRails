class AnswerLocalized < ActiveRecord::Base
  belongs_to :answer_list_content, :class_name => 'AnswerListContent', :foreign_key => :answer_id
  
  validates_presence_of :answer_length
  validates_numericality_of :answer_length, :allow_nil => false, :only_integer => true
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
end
