class OrganizationUserRule < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :rule
end
