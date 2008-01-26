class CreateDialogixUsers < ActiveRecord::Migration
  def self.up
    create_table :dialogix_users do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :dialogix_users
  end
end
