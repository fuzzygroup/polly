json.extract! poll_option, :id, :name, :poll_id, :widget_type, :value, :body, :created_at, :updated_at
json.url poll_option_url(poll_option, format: :json)
