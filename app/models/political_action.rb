class PoliticalAction < ApplicationRecord
  belongs_to :organization
  belongs_to :user
end
