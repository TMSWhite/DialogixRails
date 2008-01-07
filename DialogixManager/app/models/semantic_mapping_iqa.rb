class SemanticMappingIQA < ActiveRecord::Base
  belongs_to :semantic_mapping_i_q_a, :class_name => 'SemanticMappingIQA', :foreign_key => :semantic_mapping_i_q_a_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  belongs_to :instrument_version, :class_name => 'InstrumentVersion', :foreign_key => :instrument_version_id
  belongs_to :code_system, :class_name => 'CodeSystem', :foreign_key => :code_system_id
  has_many :semantic_mapping_i_q_as, :class_name => 'SemanticMappingIQA', :foreign_key => :semantic_mapping_i_q_a_id
  has_many :questions, :through => :semantic_mapping_i_q_as
  has_many :code_systems, :through => :semantic_mapping_i_q_as
  has_many :answers, :through => :semantic_mapping_i_q_as
  has_many :instrument_versions, :through => :semantic_mapping_i_q_as
end
