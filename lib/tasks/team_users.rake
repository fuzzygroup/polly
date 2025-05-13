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
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Event Video").first.id,
      user_id: User.where(username: "ryan").first.id,
      leader: true,
      primary_team_role: "YouTube Recording & Streaming"
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Event Video").first.id,
      user_id: User.where(username: "pride").first.id,
      leader: false,
      primary_team_role: "TikTok Streaming"
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "Event Video").first.id,
      user_id: User.where(username: "fuzzygroup").first.id,
      leader: false,
      primary_team_role: "Backup and Inadequate YouTube Recorder & Streamer"
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "fuzzygroup").first.id,
      leader: true,
      primary_team_role: "Advisory / Planning",
      secondary_team_role: "Partnerships as Kayla Needs Me"
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.jacqui,
      leader: true,
      primary_team_role: "Graphics",
      secondary_team_role: "Campaign / One Shot"
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.pride,
      leader: true,
      primary_team_role: "Partnerships",
      secondary_team_role: "Drinking Game"
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.belladonna,
      leader: false,
      primary_team_role: "Partnerships",
      secondary_team_role: nil
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "bryan").first.id,
      leader: false,
      primary_team_role: "Stat Block",
      secondary_team_role: "One Shot"
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.janet,
      leader: false,
      primary_team_role: nil,
      secondary_team_role: nil
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "bri").first.id,
      leader: false,
      primary_team_role: "Cosplayer Lead",
      secondary_team_role: nil
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "brigid_joy").first.id,
      leader: false,
      primary_team_role: "Cosplayer",
      secondary_team_role: nil
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "whitney").first.id,
      leader: false,
      primary_team_role: "Research???",
      secondary_team_role: nil
      
    )
    
    team_users_structs << 
    OpenStruct.new(
      team_id: Team.where(name: "GenCon").first.id,
      user_id: User.where(username: "anne_edwards").first.id,
      leader: false,
      primary_team_role: "Tabling",
      secondary_team_role: nil
      
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

