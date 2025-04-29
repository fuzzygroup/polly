json.extract! team_user, :id, :team_id, :user_id, :active, :leader, :notes, :created_at, :updated_at
json.url team_user_url(team_user, format: :json)
