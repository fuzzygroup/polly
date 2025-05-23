class EventSlotType < ApplicationRecord
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def self.march
    EventSlotType.where(name: "March").first
  end
  
  def self.speech
    EventSlotType.where(name: "Speech").first
  end
  
  
  def self.buffer
    EventSlotType.where(name: "Buffer").first
  end
  
  def self.music
    EventSlotType.where(name: "Music").first
  end
  
end
