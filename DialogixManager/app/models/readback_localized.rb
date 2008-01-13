class ReadbackLocalized < ActiveRecord::Base
  belongs_to :readback_localized, :class_name => 'ReadbackLocalized', :foreign_key => :readback_localized_id
  belongs_to :readback, :class_name => 'Readback', :foreign_key => :readback_id
  has_many :readback_localizeds, :class_name => 'ReadbackLocalized', :foreign_key => :readback_localized_id
  has_many :readbacks, :through => :readback_localizeds
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
end
