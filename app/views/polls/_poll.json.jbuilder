json.extract! poll, :id, :name, :share_code_id, :user_id, :organization_id, :body, :created_at, :updated_at
json.url poll_url(poll, format: :json)
