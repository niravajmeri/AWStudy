class AddTimeToTaskUsers < ActiveRecord::Migration
  def change
    add_column :task_users, :start_time, :datetime
    add_column :task_users, :end_time, :datetime
  end
end
