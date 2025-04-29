namespace :rules do 
  
  # be rake projects:init --trace
  task :init => :environment do
    Rake::Task["rules:seed"].invoke
    Rake::Task["rules:metrics"].invoke
  end
  
  # be rake rules:seed --trace
  task :seed => :environment do
    
    rules_structs = []
    rules_structs << 
    OpenStruct.new(
      name: "Adhere to the tenets of Non Violence",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "Treat others with Kindness",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "Assume that the other humans you work with are operating in good faith",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "We will not go over the meeting results so far for anyone who arrives late",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
  
    rules_structs << 
    OpenStruct.new(
      name: "We will go over the meeting results so far for anyone who arrives late",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    
    
    rules_structs << 
    OpenStruct.new(
      name: "Meeting entry will be closed after 5 minutes",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id
    )
    

    add_rules(rules_structs)
  end
  
  def add_rules(rules_structs) 
    rules_structs.each do |rule_struct|
      puts "Processing rule:\n   #{rule_struct.name}"
      status, rule = Rule.find_or_create(rule_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Rule"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

