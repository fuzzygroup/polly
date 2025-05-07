class PollOption < ApplicationRecord
  belongs_to :poll
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :poll_id]
  include FindOrCreate
  
end
