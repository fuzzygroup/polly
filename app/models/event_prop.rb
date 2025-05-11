class EventProp < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :organization_id, :user_id]
  include FindOrCreate
  
end
