namespace :team_user_rules do 
  
  # be rake team_user_rules:init --trace
  task :init => :environment do
    Rake::Task["team_user_rules:seed"].invoke
    Rake::Task["team_user_rules:metrics"].invoke
  end
  
  # be rake team_user_rules:seed --trace
  task :seed => :environment do
    
    team_user_rules_structs = []
    team_user_rules_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      rule_id: Rule.kindness.id,
      user_id: User.scott,
      agreed_to: true
    )

    team_rules_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      rule_id: Rule.not_lose_shite_publicly.id,
      user_id: User.scott,
      agreed_to: true
    )

    team_rules_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      rule_id: Rule.not_run_to_national.id,
      user_id: User.scott,
      agreed_to: true
    )

    team_rules_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      rule_id: Rule.equality_and_not_discriminate.id,
      user_id: User.scott,
      agreed_to: true
    )

    team_rules_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      rule_id: Rule.good_faith.id,
      user_id: User.scott,
      agreed_to: true
    )



    add_team_rules(team_rules_structs)
  end
  
  def add_team_rules(team_rules_structs) 
    team_rules_structs.each do |team_rules_struct|
      puts "Processing rule ..."
      status, rule = TeamRule.find_or_create(team_rules_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "TeamRule"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

