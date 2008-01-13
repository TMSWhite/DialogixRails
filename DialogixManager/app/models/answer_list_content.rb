class AnswerListContent < ActiveRecord::Base
  belongs_to :answer_list_content, :class_name => 'AnswerListContent', :foreign_key => :answer_list_content_id
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :answer_list_contents, :class_name => 'AnswerListContent', :foreign_key => :answer_list_content_id
  has_many :answers, :through => :answer_list_contents
  has_many :answer_lists, :through => :answer_list_contents
  validates_presence_of :answer_code
  validates_length_of :answer_code, :allow_nil => false, :maximum => 255
  validates_presence_of :answer_order
  validates_numericality_of :answer_order, :allow_nil => false, :only_integer => true
end
