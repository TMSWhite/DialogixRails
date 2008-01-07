class CreateInstrumentSessions < ActiveRecord::Migration
  def self.up
    create_table :instrument_session do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :instrument_session
  end
end
