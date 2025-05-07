class TeamRule < ApplicationRecord
  belongs_to :team
  belongs_to :rule
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:team_id, :rule_id]
  include FindOrCreate
end
