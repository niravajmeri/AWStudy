json.array!(@subtask_question_users) do |subtask_question_user|
  json.extract! subtask_question_user, :id, :subtask_question_id, :user_id, :description
  json.url subtask_question_user_url(subtask_question_user, format: :json)
end
