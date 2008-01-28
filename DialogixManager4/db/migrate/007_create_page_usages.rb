class CreatePageUsages < ActiveRecord::Migration
  def self.up
    create_table :page_usages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :page_usages
  end
end
