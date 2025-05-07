class OrganizationRule < ApplicationRecord
  belongs_to :organization
  belongs_to :rule
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:organization_id, :rule_id]
  include FindOrCreate
  
end
