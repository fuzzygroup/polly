json.extract! event_slot, :id, :name, :event_id, :event_slot_type_id, :speaker_id, :duration, :computed_start_at, :body, :created_at, :updated_at
json.url event_slot_url(event_slot, format: :json)
