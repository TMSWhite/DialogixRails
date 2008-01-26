class CreateV1PageUsages < ActiveRecord::Migration
  def self.up
    create_table :v1_page_usages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :v1_page_usages
  end
end
