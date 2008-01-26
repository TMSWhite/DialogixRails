class EntryItem < ActiveRecord::Base
  belongs_to :entry_instrument, :class_name => 'EntryInstrument', :foreign_key => :entry_instrument_id
  belongs_to :display_type
  #has_and_belongs_to_many :entry_questions
  has_and_belongs_to_many :entry_answers
  #acts_as_list
  validates_presence_of :name
  validates_uniqueness_of :name 
end
