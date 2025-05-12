class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :share_code
  belongs_to :organization
  belongs_to :user
  
  has_many :event_slots
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id]
  include FindOrCreate
  
  scope :active, -> { where(active: true) }
  
  #after_create :set_share_code
  
  before_validation :generate_slug, on: :create

  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end


  # def ensure_unique_slug
  #   base_slug = self.slug
  #   counter = 2
  #   while Event.exists?(slug: self.slug)
  #     self.slug = "#{base_slug}-#{counter}"
  #     counter += 1
  #   end
  # end
  
  
  
  
  
  def add_speaker(name, speaker, duration)
    est = EventSlotType.speech
    
    event_slot_struct = OpenStruct.new
    event_slot_struct.name = name
    event_slot_struct.event_slot_type_id = est.id
    event_slot_struct.speaker_id = speaker.id
    event_slot_struct.duration = duration
    event_slot_struct.event_id = self.id 
    
    status, event_slot = EventSlot.find_or_create(event_slot_struct)
  end
  
  def add_buffer
    est = EventSlotType.buffer
    
    event_slot_struct = OpenStruct.new
    event_slot_struct.name = "#{est.default_duration} Buffer"
    event_slot_struct.event_slot_type_id = est.id
    event_slot_struct.duration = est.default_duration
    event_slot_struct.event_id = self.id 
    
    # Need to skip find_or_create due to the NEED for many identical buffers
    #status, event_slot = EventSlot.find_or_create(event_slot_struct)
    es = EventSlot.new(event_slot_struct.to_h)
    #debugger
    if es.save
    else
      # jsj need to deal with this
      raise es.errors.full_messages.inspect
    end
  end
  
  def add_musician(name, musician, duration)
    est = EventSlotType.music
    
    event_slot_struct = OpenStruct.new
    event_slot_struct.name = name
    event_slot_struct.event_slot_type_id = est.id
    event_slot_struct.duration = est.default_duration
    event_slot_struct.event_id = self.id 
    event_slot_struct.musician_id = musician.id
    
    status, event_slot = EventSlot.find_or_create(event_slot_struct)
  end
  
  def add_march(name, march_duration)
    est = EventSlotType.march
    #debugger
    event_slot_type_buffer = EventSlotType.buffer
    
    event_slot_struct = OpenStruct.new
    event_slot_struct.name = name
    event_slot_struct.event_slot_type_id = est.id
    if march_duration.nil? 
      event_slot_struct.duration = est.default_duration
    else
      event_slot_struct.duration = march_duration
    end
    event_slot_struct.event_id = self.id 
    #event_slot_struct.musician_id = musician.id
    tatus, event_slot = EventSlot.find_or_create(event_slot_struct)
  end
  
  def duration_in_minutes
    durations = []
    self.event_slots.each do |es|
      durations << es.duration
    end
    durations.sum
  end
  
  def compute_start_times
    # last_start_at = 0
    # self.event_slots.each do |es|
    #   if last_start_at == 0
    #     es.computed_start_at = event.time_start
    #     last_start_at =
    #   else
    #   end
    # end
  end
  
  def duration_in_hours
    durations = []
    self.event_slots.each do |es|
      durations << es.duration
    end
    (durations.sum.to_f / 60).round(2)
  end
  
  def self.four_nineteen
    Event.where(name: "4/19 Protest").first
  end

  def self.five_one
    Event.where(name: "5/1 Protest").first
  end
  
  #private

  def generate_slug
    struct = OpenStruct.new(user_id: self.user_id, organization_id: self.organization_id)
    status, sc = ShareCode.find_or_create(struct)
    self.slug = sc.share_code
    self.share_code_id = sc.id
    #debugger
    # if title.present? && slug.blank?
    #   self.slug = title.parameterize
    #   ensure_unique_slug
    # end
  end
  
  
end
