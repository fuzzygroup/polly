namespace :events do 
  
  #bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text
  
  
  # be rake events:init --trace
  task :init => :environment do
    Rake::Task["events:seed"].invoke
    Rake::Task["events:flesh_out_525"].invoke
    Rake::Task["events:flesh_out_66"].invoke
    Rake::Task["events:flesh_out_615"].invoke    
    Rake::Task["events:metrics"].invoke
  end
  
  # be rake events:destroy_all_events_and_slots_and_tasks
  task :destroy_all_events_and_slots_and_tasks => :environment do
    events = Event.find_by_slug('lnZZZiraEU')
    events.each do |event|
      event.event_slots.each do |event_slot|
        event_slot.destroy
      end
      event.event_tasks.each do |event_task|
        event_task.destroy
      end
      event.destroy
    end
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
      has_partners: true,
      fid: '419'
      
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
      has_partners: false,
      fid: '517_pi'
      
      
    )
    
    event_structs << 
    OpenStruct.new(
      name: "5/25 - No Kings; No Executive Orders",
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
      body: "We are using the big stage and our very own FDT popup.  Our normal setup crew is on a much needed vacation so come help or come watch Scott and Amy get sweaty as they work on their swear word inventory.  Please note that the swear jar is only in effect from 12 to 3 so don't fine us early.",
      fid: '525_nk'
      
    )
    
    
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
      body: "Unload the truck, eat burgers, drink moonshine ... AND POOL should the plumbing gods smile upon us (Pool gets filled on Friday 5/23 so it should be ready but 🤞).  Seriously -- we all work hard and deserve some play time.  If you helped setup and / or run the event, I'd love to entertain you.  And if it rains?  *Wicked Laugh* -- we don't melt.  Elon's weather machine can't hurt us any more than it already has",
      fid: '525_deaddog'
      
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
317-513-8248",
      fid: '531_ed'
      
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
      body: "Need to get AVER's flags",
      fid: '66_dd'
      
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
      body: "Indiana 50501 is delighted to be participating in Greenwood Pride.  We will be a vendor with a table, giveaways and things to sell.  Come one, come all and witness the magnificence of our Anti Trump merchandise.",
      fid: '67_gw'
      
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
      has_partners: true,
      fid: '615_dd'
      
    )
    

    
    


    # event_structs <<
    # OpenStruct.new(
    #   name: "6/14 - Fort Wayne - No Kings Day",
    #   user_id: User.scott.id,
    #   organization_id: Organization.indiana50501.id,
    #   event_type: EventType.protest,
    #   date_start: Date.new(2025,6,14),
    #   date_end: Date.new(2025,6,14),
    #   time_start: "12:00",
    #   time_end: "14:00",
    #   location: "Allen County Court House",
    #   has_speakers: true,
    #   has_musicians: true,
    #   has_props: false,
    #   has_partners: true,
    #   body: "",
    #   fid: '614_fw'
    #
    # )
    

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

Together, we’re building momentum for a greener, fairer future — and it starts right now.",
      fid: '727_ed'
      
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
  
  # be rake events:flesh_out_525
  task :flesh_out_525 => :environment do
    event = Event.where(fid: '525_nk').first

    event.add_march("Opening March", 60)
    event.add_buffer
    event.add_speaker("Scott Johnson Opening Address - The Good and the Bad", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("Captain Crunch Goes to the Capital",Speaker.captain_crunch, 10)
    event.add_buffer
    event.add_musician("505051 Presents James and the Song Parodies", Musician.james, 10)
    event.add_buffer
    event.add_speaker("Resisting Oracle on The Very Essence of Being a Nation of Law Not a Nation of Executive Orders", Speaker.resisting_oracle,15)
    event.add_buffer
    s = Speaker.where(name: "Sally Alsmeyer").first
    event.add_speaker("Sally Alsmeyer - 50501's Youngest Poet Speaks Out",s, 5)
    # event.add_speaker("Scott Johnson Roams Over the Madness of Exec Orders (if no one else comes to speak)",Speaker.scott_johnson, 10)
    event.add_buffer
    #event.add_speaker("Jamie Flemington on Abortion", 10)
    #event.add_buffer
    event.add_musician("Greg Zeismer", Musician.greg_ziesemer,15)
    event.add_buffer
    event.add_speaker("TBD", Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Open Mic Time", Speaker.open_mic,10)
    event.add_buffer
    event.add_speaker("Scott Johnson Closing Remarks", Speaker.scott_johnson,10)
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
    event = Event.where(fid: '66_dd').first

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
  
  # be rake events:flesh_out_615
  task :flesh_out_615 => :environment do
    event = Event.where(fid: '615_dd').first

    event.add_speaker("Scott Johnson Opening Address - A Dad Meets Democracy", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("Brian Jonasen on the Constitution",Speaker.brian_jonasen, 10)
    event.add_buffer
    event.add_march("March", 40)
    event.add_buffer
    event.add_musician("Jen Carlson Midkiff", Musician.jen_carlson_midkiff, 15)
    event.add_buffer
    s = Speaker.where(identifier: "josh_lowry").first
    event.add_speaker("Josh Lowry", s,10)
    event.add_buffer
    s = Speaker.where(identifier: "angie_foreman").first
    event.add_speaker("Not a Dad but Still for Democracy",s, 10)
    event.add_buffer
    event.add_musician("James Does Donny Boy", Musician.james, 5)
    event.add_buffer
    event.add_speaker("Max Haddad ???", Speaker.max_haddad, 10)
    event.add_buffer
    event.add_speaker("An Immigrant Dad Speaks Out", Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Jackson Franklin Speaks Up", Speaker.jackson_franklin, 10)
    event.add_buffer
    event.add_speaker("Open Mic", Speaker.open_mic, 30)
    event.add_buffer
    event.add_speaker("Scott Johnson Closing Remarks", Speaker.scott_johnson,5)
    event.add_buffer
    event.add_musician("Moontown Pickle Stompers for Closing Act", Musician.tbd, 0)

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
  

  
  # be rake event:metrics
  task :metrics => :environment do
    klass = "Event"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

