json.extract! event, :id, :name, :event_type_id, :date_start, :date_end, :time_start, :time_end, :location, :share_code_id, :organization_id, :user_id, :has_speakers, :has_musicians, :has_props, :has_partners, :body, :created_at, :updated_at
json.url event_url(event, format: :json)
