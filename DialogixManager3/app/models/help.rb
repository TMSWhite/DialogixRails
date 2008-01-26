class Help < ActiveRecord::Base
  belongs_to :help, :class_name => 'Help', :foreign_key => :help_id
  has_many :helps, :class_name => 'Help', :foreign_key => :help_id
  has_many :help_localizeds, :class_name => 'HelpLocalized', :foreign_key => :help_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :help_id
  has_many :help_localizeds, :through => :help_localizeds
  has_many :readbacks, :through => :instrument_contents
  has_many :items, :through => :instrument_contents
  has_many :var_names, :through => :instrument_contents
  has_many :display_types, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
end
