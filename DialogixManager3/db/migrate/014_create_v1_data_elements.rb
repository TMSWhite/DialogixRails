class CreateV1DataElements < ActiveRecord::Migration
  def self.up
    create_table :v1_data_elements do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :v1_data_elements
  end
end
