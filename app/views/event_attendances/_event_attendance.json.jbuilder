json.extract! event_attendance, :id, :event_id, :organization_id, :user_id, :status, :name, :ip_address, :user_agent, :created_at, :updated_at
json.url event_attendance_url(event_attendance, format: :json)
