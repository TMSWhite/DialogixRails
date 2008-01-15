class AnswerListContent < ActiveRecord::Base
  #has_many :answers, :through => :answer_list_contents
  #has_many :answer_lists, :through => :answer_list_contents
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :items, :class_name => 'Item', :foreign_key => :item_id
  validates_presence_of :answer_code
  validates_length_of :answer_code, :allow_nil => false, :maximum => 255
  validates_presence_of :answer_order
  validates_numericality_of :answer_order, :allow_nil => false, :only_integer => true
end
