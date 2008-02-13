class SemanticMappingA < ActiveRecord::Base
  belongs_to :semantic_mapping_a, :class_name => 'SemanticMappingA'
  belongs_to :answer, :class_name => 'Answer'
  belongs_to :code_system, :class_name => 'CodeSystem'
  has_many :semantic_mapping_as, :class_name => 'SemanticMappingA'
  has_many :code_systems, :through => :semantic_mapping_as
  has_many :answers, :through => :semantic_mapping_as
end
