class SemanticMappingQA < ActiveRecord::Base
  belongs_to :semantic_mapping_q_a, :class_name => 'SemanticMappingQA'
  belongs_to :question, :class_name => 'Question'
  belongs_to :code_system, :class_name => 'CodeSystem'
  belongs_to :answer, :class_name => 'Answer'
  has_many :semantic_mapping_q_as, :class_name => 'SemanticMappingQA'
  has_many :questions, :through => :semantic_mapping_q_as
  has_many :code_systems, :through => :semantic_mapping_q_as
  has_many :answers, :through => :semantic_mapping_q_as
end
