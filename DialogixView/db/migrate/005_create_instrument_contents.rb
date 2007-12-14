class CreateInstrumentContents < ActiveRecord::Migration
  def self.up
    create_table :instrument_content do |t|
    end
  end

  def self.down
    drop_table :instrument_content
  end
end
