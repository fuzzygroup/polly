namespace :events do 
  
  #bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text
  
  
  # be rake events:init --trace
  task :init => :environment do
    Rake::Task["events:seed"].invoke
    Rake::Task["events:metrics"].invoke
  end

  # be rake events:seed --trace
  task :seed => :environment do
    
    event_structs = []
    
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
      name: "5/25 Protest - No Kings; No Executive Orders",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,5,25),
      date_end: Date.new(2025,5,25),
      time_setup: "8:00",
      time_start: "12:00",
      time_end: "15:00",
      location: "State House - STARGATE SIDE",
      has_speakers: true,
      has_musicians: true,
      has_props: true,
      has_partners: true,
      body: "We are using the big stage and our very own FDT popup.  Our normal setup crew is on a much needed vacation so come help or come watch Scott and Amy get sweaty as they work on their swear word inventory.  Please note that the swear jar is only in effect from 12 to 3 so don't fine us early."
      
    )
    
    # event_structs <<
    # OpenStruct.new(
    #   name: "5/25 Protest",
    #   user_id: User.scott.id,
    #   organization_id: Organization.indiana50501.id,
    #   event_type: EventType.protest,
    #   date_start: Date.new(2025,5,25),
    #   date_end: Date.new(2025,5,25),
    #   time_start: "12:00",
    #   time_end: "15:00",
    #   location: "State House",
    #   has_speakers: true,
    #   has_musicians: true,
    #   has_props: true,
    #   has_partners: true
    #
    # )
    
    
    event_structs << 
    OpenStruct.new(
      name: "5/25 Dead Dog After Party",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.dead_dog,
      date_start: Date.new(2025,5,25),
      date_end: Date.new(2025,5,25),
      time_start: "6:00",
      time_end: "9:00",
      location: "Scott's House",
      has_speakers: false,
      has_musicians: false,
      has_props: false,
      has_partners: false,
      visibility: 'admins_only',
      body: "Unload the truck, eat burgers, drink moonshine ... AND POOL should the plumbing gods smile upon us (Pool gets filled on Friday 5/23 so it should be ready but 🤞).  Seriously -- we all work hard and deserve some play time.  If you helped setup and / or run the event, I'd love to entertain you.  And if it rains?  *Wicked Laugh* -- we don't melt.  Elon's weather machine can't hurt us any more than it already has"
      
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

    event_structs << 
    OpenStruct.new(
      name: "6/7 - Greenwood Pride Indiana 50501 Table",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.tabling,
      date_start: Date.new(2025,6,7),
      date_end: Date.new(2025,6,7),
      time_start: "12:00",
      time_end: "18:00",
      location: "Woodmen Park (near the Greenwood High School)",
      has_speakers: false,
      has_musicians: false,
      has_props: true,
      has_partners: false,
      body: "Indiana 50501 is delighted to be participating in Greenwood Pride.  We will be a vendor with a table, giveaways and things to sell.  Come one, come all and witness the magnificence of our Anti Trump merchandise."
      
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
      name: "6/14 - Fort Wayne - No Kings Day",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,6,14),
      date_end: Date.new(2025,6,14),
      time_start: "12:00",
      time_end: "14:00",
      location: "Allen County Court House",
      has_speakers: true,
      has_musicians: true,
      has_props: false,
      has_partners: true,
      body: ""
      
    )
    

    event_structs << 
    OpenStruct.new(
      name: "7/27 - We Have Only this Planet; The Environment Matters",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      event_type: EventType.protest,
      date_start: Date.new(2025,7,27),
      date_end: Date.new(2025,7,27),
      time_start: "12:00",
      time_end: "15:00",
      location: "State House",
      has_speakers: true,
      has_musicians: true,
      has_props: true,
      has_partners: true,
      body: "With the help of our Earth Day friends, 50501 Indiana is delighted to launch our first environmental protest! 🌍✊

This will be a peaceful, creative, and powerful stand for climate justice, clean water, and a sustainable future — right here in our own community.

Stay tuned for full details — but for now, mark your calendars:
It’s happening on a Sunday, so more of us can attend without weekday conflicts.

Instead of feeding the meter, we’re asking everyone to donate what they would’ve spent on parking to help fund the 2026 Earth Day Festival. Let’s turn pavement fees into people power!

Together, we’re building momentum for a greener, fairer future — and it starts right now."
      
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

