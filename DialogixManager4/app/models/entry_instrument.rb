class EntryInstrument < ActiveRecord::Base
  has_many :entry_items, :class_name => 'EntryItem'
  #validates_presence_of :name
  #validates_length_of :name, :allow_nil => false, :maximum => 255
end
