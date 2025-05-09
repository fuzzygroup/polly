class EventType < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def self.protest
    EventType.where(name: "Protest").first
  end
  
  def self.rally
    EventType.where(name: "Rally").first
  end

  def self.march
    EventType.where(name: "March").first
  end
  
  def self.coffee_meeting
    EventType.where(name: "coffee_meeting").first
  end
  
  def self.dinner
    EventType.where(name: "dinner").first
  end

  def self.fund_raiser
    EventType.where(name: "fund_raiser").first
  end
  
  def self.campfire_hangout
    EventType.where(name: "campfire_hangout").first
  end
  
  def self.picnic
    EventType.where(name: "Picnic").first
  end
  
  def self.volunteer_pitch_in
    EventType.where(name: "Volunteer Pitch-In").first
  end

end
