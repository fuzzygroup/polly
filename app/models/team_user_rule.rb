class TeamUserRule < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :rule
end
