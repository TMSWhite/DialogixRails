class CreateAnswerListDenormalizeds < ActiveRecord::Migration
  def self.up
    create_table :answer_list_denormalizeds do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_list_denormalizeds
  end
end
