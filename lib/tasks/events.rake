namespace :events do 
  
  #bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text
  
  
  # be rake events:init --trace
  task :init => :environment do
    Rake::Task["events:seed"].invoke
    Rake::Task["events:metrics"].invoke
  end
  
  # 5/25 start with march -- 1st hour or 45 minutes 
  # 5/25 START WITH def MARCHING
  # March at the end 
  
  task :flesh_out_525 => :environment do
    event = Event.where(name: "5/25 Protest").first 
    
    event.add_march("Opening March", 60)
    event.add_buffer
    event.add_speaker("Scott Johnson Opening Address", 10)
    event.add_buffer
    event.add_musician("Jen Carlson Midkiff", 15)
    event.add_buffer
    event.add_speaker("Resisting Oracle on XYZ", 10)
    event.add_buffer
    event.add_speaker("Scott Johnson on XYZ", 10)
    event.add_buffer
    event.add_speaker("Jamie Flemington on Abortion", 10)
    event.add_buffer
    event.add_musician("Greg Zeismer", 15)
    event.add_buffer    
    event.add_speaker("Max Haddad: Let's Mock the King's Decrees", 10)
    event.add_buffer
    event.add_speaker("Scott Johnson Closing Remarks", 5)
    event.add_march("Closing March", 0)
    
    # slots = []
    # slots << OpenStruct.new(
    #
    # )
    #
    # "Opening Address by Scott"
    # slots << "Closing Address by Scott"
    # slots << "Trump Executive Order Overview by Scott"
    # slots << "Resisting Oracle on Executive Orders"
    # slots << "Executive Orders by Destiny Wells"
    
  end
  
  #
  # POLL SYSTEM
  #

  
  # be rake events:seed --trace
  task :seed => :environment do
    
    event_structs = []
    event_structs << 
    OpenStruct.new(
      name: "5/17 Picnic",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.picnic,
      date_start: Date.new(2025,5,17),
      date_end: Date.new(2025,5,17),
      time_start: "16:00",
      time_end: "19:00",
      location: "Garfield Park",
      has_speakers: false,
      has_musicians: true,
      has_props: false,
      has_partners: false
      
    )
    
    event_structs << 
    OpenStruct.new(
      name: "5/25 Protest",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,5,25),
      date_end: Date.new(2025,5,25),
      time_start: "12:00",
      time_end: "15:00",
      location: "State House",
      has_speakers: true,
      has_musicians: true,
      has_props: true,
      has_partners: true
      
    )
    
    event_structs << 
    OpenStruct.new(
      name: "5/6 FBI Protest",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,5,6),
      date_end: Date.new(2025,5,6),
      time_start: "12:00",
      time_end: "13:00",
      location: "FBI Office Castleton",
      has_speakers: false,
      has_musicians: false,
      has_props: false,
      has_partners: false
      
    )
    
    OpenStruct.new(
      name: "4/19 Protest",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,4,19),
      date_end: Date.new(2025,4,19),
      time_start: "12:00",
      time_end: "14:00",
      location: "Indianapolis State House",
      has_speakers: true,
      has_musicians: true,
      has_props: true,
      has_partners: true
      
    )
  
    add_events(event_structs)
  end
  
  def add_events(event_structs) 
    event_structs.each do |event_struct|
      puts "Processing event :\n   #{event_struct.name}"
      status, event_type = Event.find_or_create(event)
    end
  end
  

  
  # be rake event:metrics
  task :metrics => :environment do
    klass = "Event"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

