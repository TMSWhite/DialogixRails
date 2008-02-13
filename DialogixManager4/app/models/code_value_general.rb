class CodeValueGeneral < ActiveRecord::Base
  set_primary_keys :code_set_id, :seq_num, :code
  has_many :code_set, :class_name => 'CodeSet'
  validates_presence_of :seq_num
  validates_numericality_of :seq_num, :allow_nil => false, :only_integer => true
  validates_presence_of :code
  validates_length_of :code, :allow_nil => false, :maximum => 20
  validates_length_of :assigning_authority_cd, :allow_nil => true, :maximum => 20
  validates_length_of :assigning_authority_desc_txt, :allow_nil => true, :maximum => 100
  validates_length_of :code_desc_txt, :allow_nil => true, :maximum => 300
  validates_length_of :code_short_desc_txt, :allow_nil => true, :maximum => 50
  validates_length_of :code_system_cd, :allow_nil => true, :maximum => 20
  validates_length_of :code_system_desc_txt, :allow_nil => true, :maximum => 100
  validates_numericality_of :indent_level_nbr, :allow_nil => true, :only_integer => true
  validates_length_of :is_modifiable_ind, :allow_nil => true, :maximum => 1
  validates_numericality_of :nbs_uid, :allow_nil => true, :only_integer => true
  validates_length_of :parent_is_cd, :allow_nil => true, :maximum => 20
  validates_length_of :super_code, :allow_nil => true, :maximum => 20
  validates_length_of :status_cd, :allow_nil => true, :maximum => 1
end
