class CodeSet < ActiveRecord::Base
  set_primary_key :code_set_id
  has_many :code_value_generals, :class_name => 'CodeValueGeneral'
  validates_presence_of :seq_num
  validates_numericality_of :seq_num, :allow_nil => false, :only_integer => true
  validates_length_of :assigning_authority_cd, :allow_nil => true, :maximum => 20
  validates_length_of :assigning_authority_desc_txt, :allow_nil => true, :maximum => 100
  validates_length_of :code_set_desc_txt, :allow_nil => true, :maximum => 2000
  validates_length_of :code_system_cd, :allow_nil => true, :maximum => 20
  validates_length_of :code_system_desc_txt, :allow_nil => true, :maximum => 100
  validates_length_of :class_cd, :allow_nil => true, :maximum => 20
  validates_length_of :is_modifiable_ind, :allow_nil => true, :maximum => 1
  validates_numericality_of :nbs_uid, :allow_nil => true, :only_integer => true
  validates_length_of :source_version_txt, :allow_nil => true, :maximum => 20
  validates_length_of :source_domain_nm, :allow_nil => true, :maximum => 50
  validates_length_of :status_cd, :allow_nil => true, :maximum => 1
end
