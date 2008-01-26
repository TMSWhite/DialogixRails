class CreateV1ItemUsages < ActiveRecord::Migration
  def self.up
    create_table :v1_item_usages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :v1_item_usages
  end
end
