namespace :polls do 
  
  #bin/rails g scaffold Poll name:string share_code:references user:references organization:references body:text

  # be rake polls:init --trace
  task :init => :environment do
    Rake::Task["polls:seed"].invoke
    Rake::Task["polls:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    poll_structs = []
    poll_structs << 
    OpenStruct.new(
      name: "attend_517",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      body: "Are you planning to attend our 5/17 picnic?"
    )
    
    add_polls(poll_structs)
  end
  
  def add_polls(poll_structs) 
    poll_structs.each do |poll_struct|
      puts "Processing poll:\n   #{poll_struct.name}"
      
      #
      # Todo -- make this get done via the concern
      #
      struct = OpenStruct.new(user_id: poll_struct.user_id, organization_id: poll_struct.organization_id)
      status, sc = ShareCode.find_or_create(struct)
      
      poll_struct.share_code_id = sc.id
      
      status, poll = Poll.find_or_create(poll_struct)
    end
  end
  

  # be rake user:metrics
  task :metrics => :environment do
    klass = "Poll"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

