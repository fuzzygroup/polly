namespace :political_actions do 
  
  # be rake political_actions:init --trace
  task :init => :environment do
    Rake::Task["political_actions:seed"].invoke
    Rake::Task["political_actions:metrics"].invoke
  end
  
  # be rake rules:seed --trace
  task :seed => :environment do
    
    political_action_structs = []
    political_action_structs << 
    OpenStruct.new(
      name: "Call Your Representatives",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    political_action_structs << 
    OpenStruct.new(
    name: "Call Your Senators",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    political_action_structs << 
    OpenStruct.new(
      name: "Protest at _____",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    political_action_structs << 
    OpenStruct.new(
      name: "Send an Email",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
  
    political_action_structs << 
    OpenStruct.new(
      name: "Send a Fax",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    political_action_structs << 
    OpenStruct.new(
      name: "Do 5 Calls",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )

    add_political_actions(political_action_structs)
  end
  
  def add_political_actions(political_action_structs) 
    political_action_structs.each do |political_action_struct|
      puts "Processing political_action_struct:\n   #{political_action_struct.name}"
      status, political_action = PoliticalAction.find_or_create(political_action_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "PoliticalAction"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

