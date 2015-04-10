class User < ActiveRecord::Base
  has_many :task_users
  has_many :tasks, :through => :task_users
  has_many :subtask_question_users
  has_many :subtask_questions, :through => :subtask_question_users

end
