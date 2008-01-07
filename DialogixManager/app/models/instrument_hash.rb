class InstrumentHash < ActiveRecord::Base
  belongs_to :instrument_hash, :class_name => 'InstrumentHash', :foreign_key => :instrument_hash_id
  belongs_to :language_list, :class_name => 'LanguageList', :foreign_key => :language_list_id
  has_many :instrument_hashes, :class_name => 'InstrumentHash', :foreign_key => :instrument_hash_id
  has_many :instrument_versions, :class_name => 'InstrumentVersion', :foreign_key => :instrument_hash_id
  has_many :language_lists, :through => :instrument_hashes
  has_many :instruments, :through => :instrument_versions
  has_many :instrument_versions, :through => :instrument_versions
  validates_presence_of :NumEquations
  validates_numericality_of :NumEquations, :allow_nil => false, :only_integer => true
  validates_presence_of :NumQuestions
  validates_numericality_of :NumQuestions, :allow_nil => false, :only_integer => true
  validates_presence_of :VarListMD5
  validates_length_of :VarListMD5, :allow_nil => false, :maximum => 255
  validates_presence_of :NumBranches
  validates_numericality_of :NumBranches, :allow_nil => false, :only_integer => true
  validates_presence_of :NumLanguages
  validates_numericality_of :NumLanguages, :allow_nil => false, :only_integer => true
  validates_presence_of :NumTailorings
  validates_numericality_of :NumTailorings, :allow_nil => false, :only_integer => true
  validates_presence_of :NumVars
  validates_numericality_of :NumVars, :allow_nil => false, :only_integer => true
  validates_numericality_of :NumGroups, :allow_nil => true, :only_integer => true
  validates_presence_of :NumInstructions
  validates_numericality_of :NumInstructions, :allow_nil => false, :only_integer => true
  validates_presence_of :InstrumentMD5
  validates_length_of :InstrumentMD5, :allow_nil => false, :maximum => 255
end
