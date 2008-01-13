class AnswerListDenormalized < ActiveRecord::Base
  belongs_to :answer_list_denormalized, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_denormalized_id
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :answer_list_denormalizeds, :class_name => 'AnswerListDenormalized', :foreign_key => :answer_list_denormalized_id
  has_many :answer_lists, :through => :answer_list_denormalizeds
  validates_presence_of :answer_list_denormalized_length
  validates_numericality_of :answer_list_denormalized_length, :allow_nil => false, :only_integer => true
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
  validates_presence_of :name
end
