json.extract! vetting_question, :id, :body, :organization_id, :user_id, :group_id, :active, :created_at, :updated_at
json.url vetting_question_url(vetting_question, format: :json)
