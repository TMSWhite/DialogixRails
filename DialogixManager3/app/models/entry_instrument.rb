class EntryInstrument < ActiveRecord::Base
  has_many :entry_items, :class_name => 'EntryItem', :foreign_key => :entry_instrument_id
  #validates_presence_of :name
  #validates_length_of :name, :allow_nil => false, :maximum => 255
end
