class CreateInstrumentContents < ActiveRecord::Migration
  def self.up
    create_table :instrument_contents do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :instrument_contents
  end
end
