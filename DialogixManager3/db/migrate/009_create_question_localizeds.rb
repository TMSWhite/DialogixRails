class CreateQuestionLocalizeds < ActiveRecord::Migration
  def self.up
    create_table :question_localizeds do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :question_localizeds
  end
end
