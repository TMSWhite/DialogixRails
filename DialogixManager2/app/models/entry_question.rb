class EntryQuestion < ActiveRecord::Base
  
  #has_and_belongs_to_many :entry_items
  belongs_to :entry_item
  
  #validates_presence_of :name
end
