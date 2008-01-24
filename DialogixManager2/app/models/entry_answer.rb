class EntryAnswer < ActiveRecord::Base
  #has_many :entry_questions, :through => entry_items
  has_and_belongs_to_many :entry_items
  #acts_as_list  :scope => :entry_item_id 
  validates_presence_of :name
  validates_presence_of :answer_code
end



