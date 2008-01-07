class Readback < ActiveRecord::Base
  belongs_to :readback, :class_name => 'Readback', :foreign_key => :readback_id
  has_many :instrument_contents, :class_name => 'InstrumentContent', :foreign_key => :readback_id
  has_many :readbacks, :class_name => 'Readback', :foreign_key => :readback_id
  has_many :readback_localizeds, :class_name => 'ReadbackLocalized', :foreign_key => :readback_id
  has_many :items, :through => :instrument_contents
  has_many :var_names, :through => :instrument_contents
  has_many :display_types, :through => :instrument_contents
  has_many :helps, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
  has_many :readback_localizeds, :through => :readback_localizeds
end
