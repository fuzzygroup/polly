class Availability < ApplicationRecord
  belongs_to :user
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:organization_id, :user_id, :date_start]
  include FindOrCreate
end
