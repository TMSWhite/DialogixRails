class HelpLocalized < ActiveRecord::Base
  belongs_to :help_localized, :class_name => 'HelpLocalized'
  belongs_to :help, :class_name => 'Help'
  has_many :help_localizeds, :class_name => 'HelpLocalized'
  has_many :helps, :through => :help_localizeds
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
end
