class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :share_code
  belongs_to :organization
  belongs_to :user
  
  has_many :event_slots
  
  after_create :set_share_code
  
  
  def add_speaker(name, duration)
    event_slot_type = EventSlotType.speaker
  end
  
  def add_buffer
    event_slot_type_buffer = EventSlotType.buffer
  end
  
  def add_musician(name, duration)
    event_slot_type = EventSlotType.musician
    event_slot_type_buffer = EventSlotType.buffer
  end
  
  def add_march(name, duration)
    event_slot_type = EventSlotType.march
    event_slot_type_buffer = EventSlotType.buffer
    
  end
  
  def duration
    durations = []
    self.event_slots.each do |es|
      durations << es.duration
    end
    durations.sum
  end
  
  def self.four_nineteen
    Event.where(name: "4/19 Protest").first
  end

  def self.five_one
    Event.where(name: "5/1 Protest").first
  end
  
  
  
end
