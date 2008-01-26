class Question < ActiveRecord::Base
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  has_many :items, :class_name => 'Item', :foreign_key => :question_id
  has_many :questions, :class_name => 'Question', :foreign_key => :question_id
  has_many :question_localizeds, :class_name => 'QuestionLocalized', :foreign_key => :question_id
  has_many :semantic_mapping_i_q_as, :class_name => 'SemanticMappingIQA', :foreign_key => :question_id
  has_many :semantic_mapping_qs, :class_name => 'SemanticMappingQ', :foreign_key => :question_id
  has_many :semantic_mapping_q_as, :class_name => 'SemanticMappingQA', :foreign_key => :question_id
  has_many :items, :through => :items
  has_many :validations, :through => :items
  has_many :data_types, :through => :items
  has_many :answer_lists, :through => :items
  has_many :question_localizeds, :through => :question_localizeds
  has_many :code_systems, :through => :semantic_mapping_i_q_as
  has_many :answers, :through => :semantic_mapping_i_q_as
  has_many :semantic_mapping_i_q_as, :through => :semantic_mapping_i_q_as
  has_many :instrument_versions, :through => :semantic_mapping_i_q_as
  has_many :code_systems, :through => :semantic_mapping_qs
  has_many :semantic_mapping_qs, :through => :semantic_mapping_qs
  has_many :code_systems, :through => :semantic_mapping_q_as
  has_many :answers, :through => :semantic_mapping_q_as
  has_many :semantic_mapping_q_as, :through => :semantic_mapping_q_as
end
