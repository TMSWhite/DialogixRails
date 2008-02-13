class SemanticMappingIQA < ActiveRecord::Base
  belongs_to :semantic_mapping_i_q_a, :class_name => 'SemanticMappingIQA'
  belongs_to :question, :class_name => 'Question'
  belongs_to :answer, :class_name => 'Answer'
  belongs_to :code_system, :class_name => 'CodeSystem'
  belongs_to :instrument_version, :class_name => 'InstrumentVersion'
  has_many :semantic_mapping_i_q_as, :class_name => 'SemanticMappingIQA'
  has_many :questions, :through => :semantic_mapping_i_q_as
  has_many :code_systems, :through => :semantic_mapping_i_q_as
  has_many :answers, :through => :semantic_mapping_i_q_as
  has_many :instrument_versions, :through => :semantic_mapping_i_q_as
end
