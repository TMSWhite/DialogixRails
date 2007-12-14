class V1ItemUsage < ActiveRecord::Base
  set_primary_key('V1ItemUsage_ID')
  belongs_to :instrument_session, :foreign_key => 'V1InstrumentSession_ID'
end
