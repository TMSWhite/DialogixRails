class EntryItem < ActiveRecord::Base
  belongs_to :entry_instrument
  acts_as_list :scope => :entry_instrument
  
  belongs_to :display_type
  #has_and_belongs_to_many :entry_questions
  has_many :entry_answers
  
  validates_presence_of :name
  validates_uniqueness_of :name 
end
