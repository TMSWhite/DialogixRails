class SemanticMappingQ < ActiveRecord::Base
  belongs_to :semantic_mapping_q, :class_name => 'SemanticMappingQ'
  belongs_to :question, :class_name => 'Question'
  belongs_to :code_system, :class_name => 'CodeSystem'
  has_many :semantic_mapping_qs, :class_name => 'SemanticMappingQ'
  has_many :questions, :through => :semantic_mapping_qs
  has_many :code_systems, :through => :semantic_mapping_qs
end
