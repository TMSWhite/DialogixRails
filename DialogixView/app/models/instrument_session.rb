class InstrumentSession < ActiveRecord::Base
  set_primary_key('InstrumentSession_ID')
  #def self.find_all_instruments
  #  find(:all)
  #end
  belongs_to :dialogix_user, :foreign_key => 'DialogixUser_ID'
  has_many :v1_item_usage, :foreign_key => 'V1InstrumentSession_ID'
end
