class CreateDialogixUsers < ActiveRecord::Migration
  def self.up
    create_table :dialogix_user do |t|
    end
  end

  def self.down
    drop_table :dialogix_user
  end
end
