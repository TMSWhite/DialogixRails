class InstrumentHash < ActiveRecord::Base
  belongs_to :instrument_hash, :class_name => 'InstrumentHash', :foreign_key => :instrument_hash_id
  belongs_to :language_list, :class_name => 'LanguageList', :foreign_key => :language_list_id
  has_many :instrument_hashes, :class_name => 'InstrumentHash', :foreign_key => :instrument_hash_id
  has_many :instrument_versions, :class_name => 'InstrumentVersion', :foreign_key => :instrument_hash_id
  has_many :language_lists, :through => :instrument_hashes
  has_many :instruments, :through => :instrument_versions
  has_many :instrument_versions, :through => :instrument_versions
  validates_presence_of :num_equations
  validates_numericality_of :num_equations, :allow_nil => false, :only_integer => true
  validates_presence_of :num_questions
  validates_numericality_of :num_questions, :allow_nil => false, :only_integer => true
  validates_presence_of :var_list_md5
  validates_length_of :var_list_md5, :allow_nil => false, :maximum => 255
  validates_presence_of :num_branches
  validates_numericality_of :num_branches, :allow_nil => false, :only_integer => true
  validates_presence_of :num_languages
  validates_numericality_of :num_languages, :allow_nil => false, :only_integer => true
  validates_presence_of :num_tailorings
  validates_numericality_of :num_tailorings, :allow_nil => false, :only_integer => true
  validates_presence_of :num_vars
  validates_numericality_of :num_vars, :allow_nil => false, :only_integer => true
  validates_numericality_of :num_groups, :allow_nil => true, :only_integer => true
  validates_presence_of :num_instructions
  validates_numericality_of :num_instructions, :allow_nil => false, :only_integer => true
  validates_presence_of :instrument_md5
  validates_length_of :instrument_md5, :allow_nil => false, :maximum => 255
end
