class CreateEntryQuestions < ActiveRecord::Migration
  def self.up
    create_table :entry_questions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :entry_questions
  end
end
