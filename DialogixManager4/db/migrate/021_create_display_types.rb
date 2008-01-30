class CreateDisplayTypes < ActiveRecord::Migration
  def self.up
    create_table :display_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :display_types
  end
end
