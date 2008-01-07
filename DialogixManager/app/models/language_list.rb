class LanguageList < ActiveRecord::Base
  belongs_to :language_list, :class_name => 'LanguageList', :foreign_key => :language_list_id
  has_many :instrument_hashes, :class_name => 'InstrumentHash', :foreign_key => :language_list_id
  has_many :language_lists, :class_name => 'LanguageList', :foreign_key => :language_list_id
  has_many :instrument_hashes, :through => :instrument_hashes
  validates_presence_of :LanguageList
end
