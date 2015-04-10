class Subtask < ActiveRecord::Base
  #attr_accessible :task_id
  belongs_to :task
  has_many :subtask_questions
end
