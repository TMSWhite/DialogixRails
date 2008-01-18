class EntryQuestion < ActiveRecord::Base
  #has_many :entry_answers, :through => entry_items
  has_and_belongs_to_many :entry_items
  
  #validates_presence_of :name
end
