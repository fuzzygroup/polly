json.extract! speech, :id, :name, :tags, :speaker_id, :user_id, :event_id, :body, :created_at, :updated_at
json.url speech_url(speech, format: :json)
