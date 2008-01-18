class EntryAnswer < ActiveRecord::Base
  #has_many :entry_questions, :through => entry_items
  has_and_belongs_to_many :entry_items
 
 
  #validates_presence_of :name
end



