json.extract! political_action, :id, :name, :active, :organization_id, :user_id, :details, :created_at, :updated_at
json.url political_action_url(political_action, format: :json)
