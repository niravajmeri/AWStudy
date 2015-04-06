json.array!(@subtask_users) do |subtask_user|
  json.extract! subtask_user, :id, :subtask_id, :user_id, :status, :start_time, :end_time, :answer1, :answer2, :answer3, :answer4, :answer5
  json.url subtask_user_url(subtask_user, format: :json)
end
