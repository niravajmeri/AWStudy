json.array!(@task_users) do |task_user|
  json.extract! task_user, :id, :task_id, :user_id, :status
  json.url task_user_url(task_user, format: :json)
end
