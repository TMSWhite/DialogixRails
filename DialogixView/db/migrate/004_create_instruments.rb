class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instrument do |t|
    end
  end

  def self.down
    drop_table :instrument
  end
end
