json.extract! poll_response, :id, :poll_id, :value, :created_at, :updated_at
json.url poll_response_url(poll_response, format: :json)
