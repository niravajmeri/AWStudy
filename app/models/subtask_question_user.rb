class SubtaskQuestionUser < ActiveRecord::Base
  #attr_accessible :subtaskquestion_id, :user
  belongs_to :subtask_question
  belongs_to :user
end
