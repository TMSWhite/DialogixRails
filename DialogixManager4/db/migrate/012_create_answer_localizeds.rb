class CreateAnswerLocalizeds < ActiveRecord::Migration
  def self.up
    create_table :answer_localizeds do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_localizeds
  end
end
