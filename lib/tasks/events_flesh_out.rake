namespace :events_flesh_out do

  #bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text


  # be rake events:init --trace
  task :init => :environment do
    Rake::Task["events_flesh_out:seed"].invoke
    Rake::Task["events:metrics"].invoke
  end

  # be rake events:flesh_out_614_fort_wayne
  task :flesh_out_614_fort_wayne => :environment do
    event = Event.where(name: "6/14 - Fort Wayne - No Kings Day").first

    event.add_speaker("Kyle Quandt Opening Address - The Good and the Bad", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("TBD",Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Indivisible",Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Fort Wayne Dems",Speaker.tbd, 10)
    event.add_buffer
    event.add_speaker("Resisting Oracle on Something or Other", Speaker.resisting_oracle,10)
    event.add_buffer
    event.add_speaker("Open Mic -- How Do You Feel / What's Bugging You",Speaker.scott_johnson, 30)
    event.add_buffer
    event.add_musician("TBD", Musician.tbd, 15)
    event.add_buffer
    event.add_speaker("Max Haddad: Let's Mock the King's Decrees", Speaker.max_haddad, 10)
    event.add_buffer
    event.add_speaker("Kyle Quandt Closing Remarks", Speaker.scott_johnson,5)
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

  # 5/25 start with march -- 1st hour or 45 minutes
  # 5/25 START WITH def MARCHING
  # March at the end

  # be rake events:flesh_out_525
  task :flesh_out_525 => :environment do
    event = Event.where(name: "5/25 Protest - No Kings; No Executive Orders").first

    event.add_march("Opening March", 60)
    event.add_buffer
    event.add_speaker("Scott Johnson Opening Address - The Good and the Bad", Speaker.scott_johnson,10)
    event.add_buffer
    event.add_speaker("Captain Crunch Goes to the Capital",Speaker.captain_crunch, 10)
    event.add_buffer
    event.add_musician("505051 Presents James and the Song Parodies", Musician.tbd, 15)
    event.add_buffer
    event.add_speaker("Resisting Oracle on The Very Essence of Being a Nation of Law Not a Nation of Executive Orders", Speaker.resisting_oracle,10)
    event.add_buffer
    event.add_speaker("TBD",Speaker.tbd, 10)
    # event.add_speaker("Scott Johnson Roams Over the Madness of Exec Orders (if no one else comes to speak)",Speaker.scott_johnson, 10)
    event.add_buffer
    #event.add_speaker("Jamie Flemington on Abortion", 10)
    #event.add_buffer
    event.add_musician("Greg Zeismer", Musician.greg_ziesemer,15)
    event.add_buffer
    event.add_speaker("Max Haddad: Let's Mock the King's Decrees", Speaker.max_haddad, 10)
    event.add_buffer
    event.add_speaker("Open Mic Time", Speaker.open_mic,15)
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
    event.add_musician("James Does Donny Boy", 0)
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
    event.add_musician("Moontown Pickle Stompers for Closing Act", 0)

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






  # be rake event:metrics
  task :metrics => :environment do
    klass = "Event"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end

end

