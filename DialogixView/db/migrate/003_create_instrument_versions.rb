class CreateInstrumentVersions < ActiveRecord::Migration
  def self.up
    create_table :instrument_version do |t|
    end
  end

  def self.down
    drop_table :instrument_version
  end
end
