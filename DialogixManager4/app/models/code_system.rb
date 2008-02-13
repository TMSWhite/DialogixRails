class CodeSystem < ActiveRecord::Base
  set_primary_keys :code_set_id, :seq_num
  belongs_to :code_system, :class_name => 'CodeSystem'
  has_many :code_systems, :class_name => 'CodeSystem'
  has_many :semantic_mapping_as, :class_name => 'SemanticMappingA'
  has_many :semantic_mapping_i_q_as, :class_name => 'SemanticMappingIQA'
  has_many :semantic_mapping_qs, :class_name => 'SemanticMappingQ'
  has_many :semantic_mapping_q_as, :class_name => 'SemanticMappingQA'
  has_many :semantic_mapping_as, :through => :semantic_mapping_as
  has_many :answers, :through => :semantic_mapping_as
  has_many :questions, :through => :semantic_mapping_i_q_as
  has_many :answers, :through => :semantic_mapping_i_q_as
  has_many :semantic_mapping_i_q_as, :through => :semantic_mapping_i_q_as
  has_many :instrument_versions, :through => :semantic_mapping_i_q_as
  has_many :questions, :through => :semantic_mapping_qs
  has_many :semantic_mapping_qs, :through => :semantic_mapping_qs
  has_many :questions, :through => :semantic_mapping_q_as
  has_many :answers, :through => :semantic_mapping_q_as
  has_many :semantic_mapping_q_as, :through => :semantic_mapping_q_as
  validates_length_of :name, :allow_nil => true, :maximum => 255
  validates_length_of :code_system_oid, :allow_nil => true, :maximum => 255
end
