json.extract! event_prop, :id, :name, :organization_id, :user_id, :body, :created_at, :updated_at
json.url event_prop_url(event_prop, format: :json)
