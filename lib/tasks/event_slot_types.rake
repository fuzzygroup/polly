namespace :event_slot_types do 
  
  #bin/rails g scaffold EventSlotType name:string default_duration:integer default_duration_units:string
  
  # be rake event_slot_types:init --trace
  task :init => :environment do
    Rake::Task["event_slot_types:seed"].invoke
    Rake::Task["event_slot_types:metrics"].invoke
  end
  
  # be rake event_slot_types:seed --trace
  task :seed => :environment do
    
    event_slot_type_structs = []
    event_slot_type_structs << 
    OpenStruct.new(
      name: "March",
      default_duration: 60,
      default_duration_units: 'minutes'
    )
    
    event_slot_type_structs << 
    OpenStruct.new(
      name: "Speaker",
      default_duration: 10,
      default_duration_units: 'minutes'
    )

    event_slot_type_structs << 
    OpenStruct.new(
      name: "Speech",
      default_duration: 10,
      default_duration_units: 'minutes'
    )

    
    event_slot_type_structs << 
    OpenStruct.new(
      name: "Musician",
      default_duration: 15,
      default_duration_units: 'minutes'
    )
    
    event_slot_type_structs << 
    OpenStruct.new(
      name: "Music",
      default_duration: 15,
      default_duration_units: 'minutes'
    )
    
    event_slot_type_structs << 
    OpenStruct.new(
      name: "Buffer",
      default_duration: 3,
      default_duration_units: 'minutes'
    )
    
    event_slot_type_structs << 
    OpenStruct.new(
      name: "Volunteer - 1 Hour",
      default_duration: 60,
      default_duration_units: 'minutes'
    )

    event_slot_type_structs << 
    OpenStruct.new(
      name: "Volunteer - 1/2 Hour",
      default_duration: 30,
      default_duration_units: 'minutes'
    )
  
    add_event_slot_types(event_slot_type_structs)
  end
  
  def add_event_slot_types(event_slot_type_structs) 
    event_slot_type_structs.each do |event_slot_type_struct|
      puts "Processing event slot type:\n   #{event_slot_type_struct.name}"
      status, event_slot_type = EventSlotType.find_or_create(event_slot_type_struct)
    end
  end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "EventSlotType"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

