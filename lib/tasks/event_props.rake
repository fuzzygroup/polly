namespace :event_props do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake event_props:init --trace
  task :init => :environment do
    Rake::Task["event_props:seed"].invoke
    Rake::Task["event_props:metrics"].invoke
  end
  
  # be rake event_props:seed --trace
  task :seed => :environment do
    
    event_prop_structs = []
    event_prop_structs << 
    OpenStruct.new(
      name: "Big Stage",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      body: "Note: requires 15' Uhaul truck to move and MOVING CREW"
    )
    
    event_prop_structs << 
    OpenStruct.new(
      name: "Missing Politician Milk Carton",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      body: "Requires good battery to make light up"
    )
    
    event_prop_structs << 
    OpenStruct.new(
      name: "Donald Trump Cut Out",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      body: "Don't let Tori near it"
    )
    
    event_prop_structs << 
    OpenStruct.new(
      name: "Smash-A-Tron 5000",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "White FDT Speaker Tent",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 1",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_prop_structs << 
    OpenStruct.new(
    name: "8' Popup 2",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 3",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 4",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 5",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 6",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "8' Popup 7",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "Full Audio Rig with Mixer",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "EverCore Portable Speaker with Stand for Warm Up Music",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "Large Dual Battery System Loaner from DGL",
      user_id: User.dgl.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "Large Battery #1",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "Large Battery #2",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "Small Schneider Battery #1",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    event_prop_structs << 
    OpenStruct.new(
      name: "JBL PartyBox Loaner from Resisting Oracle",
      user_id: User.resisting_oracle.id,
      organization_id: Organization.indiana50501.id
    )

  
    add_event_props(event_prop_structs)
  end
  
  def add_event_props(event_prop_structs) 
    event_prop_structs.each do |event_prop_struct|
      puts "Processing event prop:\n   #{event_prop_struct.name}"








      status, event_prop = EventProp.find_or_create(event_prop_struct)
    end
  end
  

  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "EventProp"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

