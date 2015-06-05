class AddIsTimedToTaskUsers < ActiveRecord::Migration
  def change
    add_column :task_users, :is_timed, :boolean
  end
end
