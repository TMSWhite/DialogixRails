class CreatePageUsageEvents < ActiveRecord::Migration
  def self.up
    create_table :page_usage_events do |t|
    end
  end

  def self.down
    drop_table :page_usage_events
  end
end
