class SubtaskUser < ActiveRecord::Base
  #attr_accessible :subtask_id, :user_id
  belongs_to :subtask
  belongs_to :user
end
