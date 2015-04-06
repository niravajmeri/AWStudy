class CreateSubtaskUsers < ActiveRecord::Migration
  def change
    create_table :subtask_users do |t|
      t.integer :subtask_id
      t.integer :user_id
      t.integer :status
      t.datetime :start_time
      t.datetime :end_time
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.string :answer5

      t.timestamps
    end
  end
end
