class SemanticMappingA < ActiveRecord::Base
  belongs_to :semantic_mapping_a, :class_name => 'SemanticMappingA', :foreign_key => :semantic_mapping_a_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  belongs_to :code_system, :class_name => 'CodeSystem', :foreign_key => :code_system_id
  has_many :semantic_mapping_as, :class_name => 'SemanticMappingA', :foreign_key => :semantic_mapping_a_id
  has_many :code_systems, :through => :semantic_mapping_as
  has_many :answers, :through => :semantic_mapping_as
end
