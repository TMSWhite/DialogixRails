class AnswerList < ActiveRecord::Base
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :answer_lists, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :answer_list_contents, :class_name => 'AnswerListContent', :foreign_key => :answer_list_id
  has_many :answer_list_denormalizeds, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_id
  has_many :items, :class_name => 'Item', :foreign_key => :answer_list_id
  has_many :answer_list_contents, :through => :answer_list_contents
  has_many :answers, :through => :answer_list_contents
  has_many :answer_list_denormalizeds, :through => :answer_list_denormalizeds
  has_many :items, :through => :items
  has_many :validations, :through => :items
  has_many :questions, :through => :items
  has_many :data_types, :through => :items
end
