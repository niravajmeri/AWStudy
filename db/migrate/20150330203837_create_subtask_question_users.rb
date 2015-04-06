class CreateSubtaskQuestionUsers < ActiveRecord::Migration
  def change
    create_table :subtask_question_users do |t|
      t.integer :subtask_question_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
