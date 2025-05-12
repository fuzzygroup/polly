class EventAttendance < ApplicationRecord
  belongs_to :event
  belongs_to :organization
  belongs_to :user, optional: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:event_id, :ip_address, :name, :status, :user_id]
  include FindOrCreate
  
end
