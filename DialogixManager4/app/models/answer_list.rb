class AnswerList < ActiveRecord::Base
  has_many :answer_list_denormalizeds, :class_name => 'AnswerListDenormalized'
  has_one :items, :class_name => 'Item'
end
