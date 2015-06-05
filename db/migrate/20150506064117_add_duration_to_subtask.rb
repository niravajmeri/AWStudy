class AddDurationToSubtask < ActiveRecord::Migration
  def change
    add_column :subtasks, :duration, :integer
  end
end
