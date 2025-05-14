class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:team_id, :user_id]
  include FindOrCreate
  
  scope :active, -> { where(active: true) }
  
end
