class Task < ActiveRecord::Base
  has_many :subtasks
  has_many :task_users
  has_many :users, through: :task_users
end
