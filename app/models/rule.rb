class Rule < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :team
end
