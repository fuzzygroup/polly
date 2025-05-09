json.extract! musician, :id, :name, :band_name, :bio, :url, :pronouns, :play_count, :notes, :user_id, :contact_card_id, :created_at, :updated_at
json.url musician_url(musician, format: :json)
