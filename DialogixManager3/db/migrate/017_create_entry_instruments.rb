class CreateEntryInstruments < ActiveRecord::Migration
  def self.up
    create_table :entry_instruments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :entry_instruments
  end
end
