class CreateSubtaskQuestions < ActiveRecord::Migration
  def change
    create_table :subtask_questions do |t|
      t.integer :subtask_id
      t.string :description

      t.timestamps
    end
  end
end
