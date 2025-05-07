namespace :rules do 
  
  # be rake rules:init --trace
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
      organization_id: Organization.indiana50501.id,
      short_name: 'non_violence',
      active: true
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "Treat others with Kindness",
      organization_id: Organization.indiana50501.id,
      user_id: User.scott.id,
      short_name: 'kindness',
      active: true
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "Assume that the other humans you work with are operating in good faith",
      organization_id: Organization.indiana50501.id,
      user_id: User.scott.id,
      short_name: 'good_faith',
      active: true
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "We will not go over the meeting results so far for anyone who arrives late",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'not_review',
      active: true
    )
  
    rules_structs << 
    OpenStruct.new(
      name: "We will go over the meeting results so far for anyone who arrives late",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'will_review',
      active: false
    )
    
    
    rules_structs << 
    OpenStruct.new(
      name: "Meeting entry will be closed after 5 minutes",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'entry_closed_after_5_minutes',
      active: false
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "We will not lose our shite publicly; we will maintain dignity and deal with our issues internally",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'not_lose_shite_publicly',
      active: true
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "We will not run to National at the drop of a hat; we will handle our own issues",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'not_run_to_national',
      active: true
    )
    
    rules_structs << 
    OpenStruct.new(
      name: "We will treat each other with equality and not discriminate",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      short_name: 'equality_and_not_discriminate',
      active: true
    )
    

    

    add_rules(rules_structs)
  end
  
  def add_rules(rules_structs) 
    rules_structs.each do |rule_struct|
      puts "Processing rule:\n   #{rule_struct.name}"
      status, rule = Rule.find_or_create(rule_struct)
      puts "Status = #{status} -- #{rule.short_name}"
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Rule"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

