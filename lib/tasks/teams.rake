namespace :teams do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake teams:init --trace
  task :init => :environment do
    Rake::Task["teams:seed"].invoke
    Rake::Task["teams:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    team_structs = []
    team_structs << 
    OpenStruct.new(
      name: "Leadership",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKIHhXPEksicNH8kFLl0NIamuGaDyKs1X18exsin3-wDGZEhCwS_jabmLJzfbqOxeHRl1U"
    )
    
    team_structs << 
    OpenStruct.new(
      name: "5/1 Planning & Execution",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKID33AZi1cT5VO2nirhTXgE9eajWbhM5yf1_SUZ2AtGFNEhBLJGyX_ivOPxGEWEUNC6qC"
    )
    
    team_structs << 
    OpenStruct.new(
      name: "5/17 Planning & Execution",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKIN2SIAFFX9E-OkQ1ejHBsb2vtcRmVlgzrS3kUERaQgT8EhBbGq0TDb3C3h1OPjKH7TpT"
    )
    
    team_structs << 
    OpenStruct.new(
      name: "5/25 Planning & Execution",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKIPGszG7OJH__5HLgnQ-YT3hmmM-G5yk8veEQ9vRSw_XlEhCC0p1JnjZNc26LJgkFPQEz"
    )
    
    team_structs << 
    OpenStruct.new(
      name: "Money",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKILVirT3SY8tqPU-7m8uOu0Y21fjooiC2U-TxQdrLLDy8EhCM07MikEavYJpsdle-KjMR"
    )
    
    OpenStruct.new(
      name: "Resistance Arts & Crafts",
      user_id: User.pride.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKIGsdQbMqku9hJn6oWfF2cSTI1NsZBbqTDG32wSrjGsNFEhAFzqjcFKs1wDtxP86I9tTH"
    )
    
    OpenStruct.new(
      name: "Tech Work",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      active: true,
      chat_url: "https://signal.group/#CjQKIHMOA-9Bqc_y_7r5Eud3m1Wr-ZbQbjY18UOiqqcHfCxfEhDqwNKyLXCBEQw8kLp04U2V"
    )
    
    
    
  
    add_teams(team_structs)
  end
  
  def add_teams(team_structs) 
    team_structs.each do |team_struct|
      puts "Processing team:\n   #{team_struct.name}"

      status, team = Team.find_or_create(team_struct)
    end
  end
  

  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Team"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

