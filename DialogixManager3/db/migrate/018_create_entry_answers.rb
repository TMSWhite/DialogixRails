class CreateEntryAnswers < ActiveRecord::Migration
  def self.up
    create_table :entry_answers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :entry_answers
  end
end
