class EventSlot < ApplicationRecord
  belongs_to :event
  belongs_to :event_slot_type
  belongs_to :speaker, optional: true
  belongs_to :musician, optioal: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :event_id]
  include FindOrCreate
  
end
