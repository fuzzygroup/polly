class EventSlotType < ApplicationRecord
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def self.march
    EventSlotType.where(name: "March").first
  end
  
  def self.speaker
    EventSlotType.where(name: "Speaker").first
  end
  
  def self.buffer
    EventSlotType.where(name: "Buffer").first
  end
  
  def self.musician
    EventSlotType.where(name: "Musician").first
  end
  
end
