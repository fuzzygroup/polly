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
  
  # be rake events:flesh_out_525
  task :flesh_out_525 => :environment do
    event = Event.where(name: "5/25 Protest").first 
    
    event.add_march("Opening March", 60)
    event.add_buffer
    event.add_speaker("Scott Johnson Opening Address - The Good and the Bad", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("Captain Crunch Goes to the Capital",Speaker.captain_crunch, 10)
    event.add_buffer
    event.add_musician("TBD", Musician.tbd, 15)
    event.add_buffer
    event.add_speaker("Resisting Oracle on Something or Other", Speaker.resisting_oracle,10)
    event.add_buffer
    event.add_speaker("Scott Johnson Roams Over the Madness of Exec Orders (if no one else comes to speak)",Speaker.scott_johnson, 10)
    event.add_buffer
    #event.add_speaker("Jamie Flemington on Abortion", 10)
    #event.add_buffer
    event.add_musician("Greg Zeismer", Musician.greg_ziesemer,15)
    event.add_buffer    
    event.add_speaker("Max Haddad: Let's Mock the King's Decrees", Speaker.max_haddad, 10)
    event.add_buffer
    event.add_speaker("Scott Johnson Closing Remarks", Speaker.scott_johnson,5)
    event.add_buffer
    event.add_march("Closing March - Optional", 0)
    
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
  
  # be rake events:flesh_out_615
  task :flesh_out_615 => :environment do
    event = Event.where(name: "6/15 Protest - Dads for Democracy").first 
    
    event.add_speaker("Scott Johnson Opening Address - A Dad Meets Democracy", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("Brian Jonasen",Speaker.brian_jonasen, 10)
    event.add_buffer
    event.add_march("March", 40)
    event.add_buffer
    event.add_musician("TBD", Musician.tbd, 15)
    event.add_buffer
    s = Speaker.where(identifier: "josh_lowry").first
    event.add_speaker("Josh Lowry", s,10)
    event.add_buffer
    s = Speaker.where(identifier: "angie_foreman").first
    event.add_speaker("Not a Dad but Still for Democracy",s, 10)
    event.add_buffer
    event.add_musician("TBD", Musician.tbd,15)
    event.add_buffer    
    event.add_speaker("Max Haddad ???", Speaker.max_haddad, 10)
    event.add_buffer
    event.add_speaker("An Immigrant Dad Speaks Out", Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Open Mic", Speaker.open_mic, 30)
    event.add_buffer
    event.add_speaker("Scott Johnson Closing Remarks", Speaker.scott_johnson,5)
    event.add_buffer
    event.add_march("Closing March - Optional", 0)
    
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
  
  # be rake events:flesh_out_66
  task :flesh_out_66 => :environment do
    event = Event.where(name: "6/6 Protest - D Day").first 
    
    event.add_speaker("Scott Johnson Welcoming Remarks",Speaker.scott_johnson,5)
    event.add_buffer
    event.add_musician("Jen Carlson Midkiff National Anthem", Musician.jen_carlson_midkiff, 15)
    event.add_buffer
    event.add_speaker("Color Guard Amy and Brian @ same time",Speaker.brian_jonasen,0)
    event.add_buffer
    event.add_speaker("Moment of Silence and then Taps to Honor the Dead", Speaker.brian_jonasen,10)
    event.add_buffer
    event.add_speaker("Brian Jonasen Opening Remarks w/ Group Oath",Speaker.brian_jonasen,10)
    event.add_buffer
    s = Speaker.find_by_identifier("david_hoffman")
    event.add_speaker("David Hoffman, Retired Colonel, History Teacher - Intro by Amy", s,10)
    event.add_buffer
    event.add_march("March", 60)
    event.add_buffer
    s = Speaker.find_by_identifier("renee_turner_pack")
    event.add_speaker("Renee Turner Pack, State Representative", s, 10)
    event.add_buffer
    s = Speaker.find_by_identifier("jackson_franklin")
    event.add_speaker("Jackson Franklin",s, 10)
    event.add_buffer
    s = Speaker.find_by_identifier("connie_karras")
    event.add_speaker("Connie Karras",s,  10)
    event.add_buffer
    event.add_musician("TBD", Musician.tbd, 15)
    event.add_buffer
    s = Speaker.find_by_identifier("j_d_ford")    
    event.add_speaker("J.D. Ford", s, 10)
    event.add_buffer
    event.add_speaker("Amy - Trans People Have Always Served", Speaker.amy_k, 10)
    event.add_buffer
    event.add_speaker("Open Mic - Veterans Speak Out", Speaker.tbd, 60)
    event.add_buffer
    event.add_speaker("Brian Closing Remarks", Speaker.brian_jonasen, 10)
    event.add_buffer
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
    
    event_structs << 
    OpenStruct.new(
      name: "6/15 Protest - Dads for Democracy",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,6,15),
      date_end: Date.new(2025,6,15),
      time_start: "12:00",
      time_end: "15:00",
      location: "Noblesville Court House",
      has_speakers: true,
      has_musicians: true,
      has_props: true,
      has_partners: true
      
    )
    
    event_structs << 
    OpenStruct.new(
      name: "5/31 - Earth Day Volunteering on Recycling Electronics - Man the Dumpsters!",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.volunteer_pitch_in,
      date_start: Date.new(2025,5,31),
      date_end: Date.new(2025,5,31),
      time_start: "11:00",
      time_end: "17:00",
      location: "Providence Christo Rey High School at :  2717 S East St, Indianapolis, IN 46225",
      has_speakers: false,
      has_musicians: false,
      has_props: false,
      has_partners: true,
      body: "Hello Daniel and Scott:

This is an e-introduction of you both.  Scott, your name was given to me by Greg Ziesemer as the person who will recruit and manage the volunteers for our electronics recycling. 

RecycleForce will deliver 12 Gaylord containers to the parking lot pictured below of Providence Christo Rey High School at :  2717 S East St, Indianapolis, IN 46225

We will need 2 volunteers on site the entire time - which is 11 am to 5 pm (or whenever the containers are full).  We also have some simple stake signs that will need to be put up as well. 

Daniel - we will need from you the exact time the containers will be delivered.  I hope to be on site but I am also setting up my own activity at the festival at the park.  

Also, to recognize our sponsor LRS recycling, can we tape of a sign or two on a couple of the containers?

I have posted info on our website and will link to the listed of accepted items.

Scott, truly grateful for the help. We haven't had this event in a few years and am glad to have it back.

Warmly - Laurie Counsel
Board President, Earth Day Indiana
317-513-8248"
      
    )
    
    
    event_structs << 
    OpenStruct.new(
      name: "6/6 Protest - D Day",
      user_id: User.brian.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,6,6),
      date_end: Date.new(2025,6,6),
      time_start: "12:00",
      time_end: "16:00",
      location: "Indianapolis State House",
      has_speakers: true,
      has_musicians: true,
      has_props: false,
      has_partners: true,
      body: "Need to get AVER's flags"
      
    )
  
    add_events(event_structs)
  end
  
  def add_events(event_structs) 
    event_structs.each do |event_struct|
      puts "Processing event :\n   #{event_struct.name}"
      struct = OpenStruct.new(user_id: event_struct.user_id, organization_id: event_struct.organization_id)
      # status, sc = ShareCode.find_or_create(struct)
      # event_struct.slug = sc.share_code
      status, event_type = Event.find_or_create(event_struct)
    end
  end
  

  
  # be rake event:metrics
  task :metrics => :environment do
    klass = "Event"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

