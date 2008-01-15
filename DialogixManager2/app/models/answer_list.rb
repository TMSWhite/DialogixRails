class AnswerList < ActiveRecord::Base
  has_many :answer_list_denormalizeds, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_id
  has_one :items, :class_name => 'Item', :foreign_key => :answer_list_id
  #has_many :questions, :through => :items, :source => :question_localizes
end
