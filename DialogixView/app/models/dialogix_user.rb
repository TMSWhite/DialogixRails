class DialogixUser < ActiveRecord::Base
  set_primary_key('DialogixUser_ID')
    
  validates_presence_of :first_name, :last_name, :user_name, :pwd
  
  has_many :instrument_session, :foreign_key => 'DialogixUser_ID'
end
