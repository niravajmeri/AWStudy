class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.integer :task_id
      t.string :title
      t.text :description
      t.string :attach1
      t.string :attach2
      t.string :attach3
      t.string :attach4
      t.string :attach5

      t.timestamps
    end
  end
end
