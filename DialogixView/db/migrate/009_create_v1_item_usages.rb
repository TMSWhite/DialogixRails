class CreateV1ItemUsages < ActiveRecord::Migration
  def self.up
    create_table :v1_item_usage do |t|
    end
  end

  def self.down
    drop_table :v1_item_usage
  end
end
