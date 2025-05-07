class EventSlotType < ApplicationRecord
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
end
