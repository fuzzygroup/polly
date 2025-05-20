json.extract! event_task, :id, :name, :event_id, :user_id, :team_id, :done, :body, :notes, :created_at, :updated_at
json.url event_task_url(event_task, format: :json)
