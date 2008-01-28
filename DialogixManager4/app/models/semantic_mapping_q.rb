class SemanticMappingQ < ActiveRecord::Base
  belongs_to :semantic_mapping_q, :class_name => 'SemanticMappingQ', :foreign_key => :semantic_mapping_q_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  belongs_to :code_system, :class_name => 'CodeSystem', :foreign_key => :code_system_id
  has_many :semantic_mapping_qs, :class_name => 'SemanticMappingQ', :foreign_key => :semantic_mapping_q_id
  has_many :questions, :through => :semantic_mapping_qs
  has_many :code_systems, :through => :semantic_mapping_qs
end
