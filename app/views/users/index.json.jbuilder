json.array!(@users) do |user|
  json.extract! user, :id, :mturk_id, :password, :email
  json.url user_url(user, format: :json)
end
