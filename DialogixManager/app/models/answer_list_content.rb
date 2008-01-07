class AnswerListContent < ActiveRecord::Base
  belongs_to :answer_list_content, :class_name => 'AnswerListContent', :foreign_key => :answer_list_content_id
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :answer_list_contents, :class_name => 'AnswerListContent', :foreign_key => :answer_list_content_id
  has_many :answers, :through => :answer_list_contents
  has_many :answer_lists, :through => :answer_list_contents
  validates_presence_of :AnswerCode
  validates_length_of :AnswerCode, :allow_nil => false, :maximum => 255
  validates_presence_of :AnswerOrder
  validates_numericality_of :AnswerOrder, :allow_nil => false, :only_integer => true
end
