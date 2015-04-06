json.array!(@subtask_questions) do |subtask_question|
  json.extract! subtask_question, :id, :subtask_id, :description
  json.url subtask_question_url(subtask_question, format: :json)
end
