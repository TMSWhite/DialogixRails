class Answer < ActiveRecord::Base
  belongs_to :answer, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :answers, :class_name => 'Answer', :foreign_key => :answer_id
  has_many :answer_list_contents, :class_name => 'AnswerListContent', :foreign_key => :answer_id
  has_many :answer_localizeds, :class_name => 'AnswerLocalized', :foreign_key => :answer_id
  has_many :data_elements, :class_name => 'DataElement', :foreign_key => :answer_id
  has_many :item_usages, :class_name => 'ItemUsage', :foreign_key => :answer_id
  has_many :semantic_mapping_as, :class_name => 'SemanticMappingA', :foreign_key => :answer_id
  has_many :semantic_mapping_i_q_as, :class_name => 'SemanticMappingIQA', :foreign_key => :answer_id
  has_many :semantic_mapping_q_as, :class_name => 'SemanticMappingQA', :foreign_key => :answer_id
  has_many :answer_list_contents, :through => :answer_list_contents
  has_many :answer_lists, :through => :answer_list_contents
  has_many :answer_localizeds, :through => :answer_localizeds
  has_many :var_names, :through => :data_elements
  has_many :instrument_sessions, :through => :data_elements
  has_many :instrument_contents, :through => :data_elements
  has_many :null_flavors, :through => :data_elements
  has_many :data_elements, :through => :data_elements
  has_many :var_names, :through => :item_usages
  has_many :item_usages, :through => :item_usages
  has_many :instrument_sessions, :through => :item_usages
  has_many :instrument_contents, :through => :item_usages
  has_many :null_flavors, :through => :item_usages
  has_many :code_systems, :through => :semantic_mapping_as
  has_many :semantic_mapping_as, :through => :semantic_mapping_as
  has_many :questions, :through => :semantic_mapping_i_q_as
  has_many :code_systems, :through => :semantic_mapping_i_q_as
  has_many :semantic_mapping_i_q_as, :through => :semantic_mapping_i_q_as
  has_many :instrument_versions, :through => :semantic_mapping_i_q_as
  has_many :questions, :through => :semantic_mapping_q_as
  has_many :code_systems, :through => :semantic_mapping_q_as
  has_many :semantic_mapping_q_as, :through => :semantic_mapping_q_as
  validates_inclusion_of :hasLAcode, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :LAcode, :allow_nil => true, :maximum => 255
end
