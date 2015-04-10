class SubtaskQuestion < ActiveRecord::Base
  #attr_accessible :subtask_id
  belongs_to :subtask
end
