json.extract! event_volunteer, :id, :first_name, :last_name, :pronouns, :phone_number, :email, :event_id, :user_id, :how_do_you_want_to_help, :created_at, :updated_at
json.url event_volunteer_url(event_volunteer, format: :json)
