class CreateItemUsages < ActiveRecord::Migration
  def self.up
    create_table :item_usages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :item_usages
  end
end
