json.extract! confirmation, :id, :confirmable_id, :confirmable_type, :event_slot_id, :confirmed, :created_at, :updated_at
json.url confirmation_url(confirmation, format: :json)
