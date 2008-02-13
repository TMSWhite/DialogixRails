class EntryItem < ActiveRecord::Base
  #acts_as_list
  belongs_to :entry_instrument, :class_name => 'EntryInstrument'
  belongs_to :display_type
  #has_and_belongs_to_many :entry_questions
  has_many :entry_answers
  
  validates_presence_of :name
  validates_uniqueness_of :name 
end
