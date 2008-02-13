class Readback < ActiveRecord::Base
  belongs_to :readback, :class_name => 'Readback'
  has_many :instrument_contents, :class_name => 'InstrumentContent'
  has_many :readbacks, :class_name => 'Readback'
  has_many :readback_localizeds, :class_name => 'ReadbackLocalized'
  has_many :items, :through => :instrument_contents
  has_many :var_names, :through => :instrument_contents
  has_many :helps, :through => :instrument_contents
  has_many :display_types, :through => :instrument_contents
  has_many :instrument_contents, :through => :instrument_contents
  has_many :instrument_versions, :through => :instrument_contents
  has_many :readback_localizeds, :through => :readback_localizeds
end
