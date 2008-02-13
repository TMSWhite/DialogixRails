class EntryAnswer < ActiveRecord::Base
 #has_many :entry_questions, :through => entry_items
  belongs_to :entry_item
  acts_as_list  :scope => :entry_item
  validates_presence_of :name
  validates_presence_of :answer_code
end



