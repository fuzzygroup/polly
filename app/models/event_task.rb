class EventTask < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :team, optional: true 
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:organization_id, :event_id, :name, :team_id, :user_id]
  include FindOrCreate
end
