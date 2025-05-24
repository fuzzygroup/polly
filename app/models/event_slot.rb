class EventSlot < ApplicationRecord
  default_scope { where("event_slot_type_id <> 3") }
  
  belongs_to :event
  belongs_to :event_slot_type
  belongs_to :speaker, optional: true
  belongs_to :musician, optional: true
  
  has_one :confirmation
  #has_one :speech
  
  def has_speaker?
    return true if self.event_slot_type_id == EventSlotType.speech.id
  end
  
  def speech
    Speech.where(id: self.speech_id).first
  end
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :event_id]
  include FindOrCreate
  
  def is_confirmed?
    return false
    #return true if self.confirmation.try(:confirmed)
    #return false
  end
  
  def computed_duration
    self.duration + 3
  end
  
  def time_start
    Time.now
  end
  
  def time_end
    Time.now
  end
  
end
