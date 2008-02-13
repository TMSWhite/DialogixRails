class ReadbackLocalized < ActiveRecord::Base
  belongs_to :readback_localized, :class_name => 'ReadbackLocalized'
  belongs_to :readback, :class_name => 'Readback'
  has_many :readback_localizeds, :class_name => 'ReadbackLocalized'
  has_many :readbacks, :through => :readback_localizeds
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
end
