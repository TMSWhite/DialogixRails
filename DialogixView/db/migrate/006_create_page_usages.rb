class CreatePageUsages < ActiveRecord::Migration
  def self.up
    create_table :page_usage do |t|
    end
  end

  def self.down
    drop_table :page_usage
  end
end
