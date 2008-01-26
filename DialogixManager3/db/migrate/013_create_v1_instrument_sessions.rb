class CreateV1InstrumentSessions < ActiveRecord::Migration
  def self.up
    create_table :v1_instrument_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :v1_instrument_sessions
  end
end
