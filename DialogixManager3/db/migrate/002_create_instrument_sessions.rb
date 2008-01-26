class CreateInstrumentSessions < ActiveRecord::Migration
  def self.up
    create_table :instrument_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :instrument_sessions
  end
end
