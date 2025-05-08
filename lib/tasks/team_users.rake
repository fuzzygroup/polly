namespace :team_users do 
  
  # be rake team_users:init --trace
  task :init => :environment do
    Rake::Task["team_users:seed"].invoke
    Rake::Task["team_users:metrics"].invoke
  end
  
  # be rake team_users:seed --trace
  task :seed => :environment do
    
    team_users_structs = []
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.scott.id,
      leader: true
    )

    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.sara.id,
      leader: false
    )


    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.brian.id,
      leader: false
    )


    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.belladonna.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.taelar.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.jacqui.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.tori.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.janet.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.amyk.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.pride.id,
      leader: false
    )

    team_users_structs << 
    OpenStruct.new(
      team_id: Team.leadership.id,
      user_id: User.resisting_oracle.id,
      leader: false
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Tiger Team B").first.id,
      user_id: User.scott.id,
      leader: true
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Tiger Team B").first.id,
      user_id: User.brian.id,
      leader: true
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Tiger Team B").first.id,
      user_id: User.amyk.id,
      leader: true
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Tiger Team B").first.id,
      user_id: User.where(username: "lorid").first.id,
      leader: true
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Tiger Team B").first.id,
      user_id: User.where(username: "maryhardin").first.id,
      leader: true
    )
    
    

    
    add_team_users(team_users_structs)
  end
  
  def add_team_users(team_users_structs) 
    team_users_structs.each do |team_users_struct|
      puts "Processing team: #{team_users_struct.team_id}"
      puts "  Processing team_user ...#{team_users_struct.user_id}"
      status, rule = TeamUser.find_or_create(team_users_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "TeamUser"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

