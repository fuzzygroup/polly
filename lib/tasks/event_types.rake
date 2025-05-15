namespace :event_types do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake event_types:init --trace
  task :init => :environment do
    Rake::Task["event_types:seed"].invoke
    Rake::Task["event_types:metrics"].invoke
  end
  
  # be rake event_types:seed --trace
  task :seed => :environment do
    
    event_type_structs = []
    event_type_structs << 
    OpenStruct.new(
      name: "Protest",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Rally",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "March",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Coffee Meeting",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_type_structs << 
    OpenStruct.new(
      name: "Dinner",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Campfire Hangout",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Picnic",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Volunteer Pitch-In",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_type_structs << 
    OpenStruct.new(
      name: "Tabling",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
  
    add_event_types(event_type_structs)
  end
  
  def add_event_types(event_type_structs) 
    event_type_structs.each do |event_type_struct|
      puts "Processing event type:\n   #{event_type_struct.name}"








      status, event_type = EventType.find_or_create(event_type_struct)
    end
  end
  

  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "EventType"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

