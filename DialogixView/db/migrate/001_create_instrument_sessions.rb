class CreateInstrumentSessions < ActiveRecord::Migration
  def self.up
    create_table :instrument_sessions do |t|
    end
  end

  def self.down
    drop_table :instrument_sessions
  end
end
