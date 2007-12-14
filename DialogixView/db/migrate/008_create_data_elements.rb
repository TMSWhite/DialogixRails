class CreateDataElements < ActiveRecord::Migration
  def self.up
    create_table :data_element do |t|
    end
  end

  def self.down
    drop_table :data_element
  end
end
