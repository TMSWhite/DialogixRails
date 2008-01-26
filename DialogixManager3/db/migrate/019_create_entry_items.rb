class CreateEntryItems < ActiveRecord::Migration
  def self.up
    create_table :entry_items do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :entry_items
  end
end
