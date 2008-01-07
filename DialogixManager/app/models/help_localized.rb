class HelpLocalized < ActiveRecord::Base
  belongs_to :help_localized, :class_name => 'HelpLocalized', :foreign_key => :help_localized_id
  belongs_to :help, :class_name => 'Help', :foreign_key => :help_id
  has_many :help_localizeds, :class_name => 'HelpLocalized', :foreign_key => :help_localized_id
  has_many :helps, :through => :help_localizeds
  validates_presence_of :LanguageCode
  validates_length_of :LanguageCode, :allow_nil => false, :maximum => 2
end
