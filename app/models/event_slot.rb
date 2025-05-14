class EventSlot < ApplicationRecord
  belongs_to :event
  belongs_to :event_slot_type
  belongs_to :speaker, optional: true
  belongs_to :musician, optional: true
  
  has_one :confirmation
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :event_id]
  include FindOrCreate
  
  def is_confirmed?
    return false
    #return true if self.confirmation.try(:confirmed)
    #return false
  end
  
end
