class SubtaskQuestion < ActiveRecord::Base
  #attr_accessible :subtask_id
  belongs_to :subtask
  has_many :subtask_question_users
end
