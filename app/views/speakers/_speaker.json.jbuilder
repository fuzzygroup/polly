json.extract! speaker, :id, :name, :bio, :url, :pronouns, :speaking_count, :notes, :organization_id, :user_id, :created_at, :updated_at
json.url speaker_url(speaker, format: :json)
