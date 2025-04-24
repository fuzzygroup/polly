json.extract! project, :id, :name, :organization_id, :user_id, :group_id, :project_type, :active, :body, :created_at, :updated_at
json.url project_url(project, format: :json)
