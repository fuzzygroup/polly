json.extract! vetting_transcript, :id, :name, :organization_id, :user_id, :group_id, :chat_type, :chat_user, :active, :body, :extracted_objects, :created_at, :updated_at
json.url vetting_transcript_url(vetting_transcript, format: :json)
