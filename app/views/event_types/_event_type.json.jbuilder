json.extract! event_type, :id, :name, :organization_id, :user_id, :created_at, :updated_at
json.url event_type_url(event_type, format: :json)
