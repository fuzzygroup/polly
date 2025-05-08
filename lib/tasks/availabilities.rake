namespace :availabilities do 
  
  # be rake availabilities:init --trace
  task :init => :environment do
    Rake::Task["availabilities:seed"].invoke
    Rake::Task["availabilities:metrics"].invoke
  end
  
  # be rake team_users:seed --trace
  task :seed => :environment do
    
    availabilities_structs = []
    availabilities_structs << 
    OpenStruct.new(
      user_id: User.resisting_oracle.id,
      organization_id: Organization.indiana50501.id,
      date_start: Date.new(2025, 5, 15),
      date_end: Date.new(2025, 5, 18),
      user_id: User.resisting_oracle.id,
      availability: false
    )

    availabilities_structs << 
    OpenStruct.new(
      user_id: User.resisting_oracle.id,
      organization_id: Organization.indiana50501.id,
      date_start: Date.new(2025, 6, 6),
      date_end: Date.new(2025, 6, 10),
      user_id: User.resisting_oracle.id,
      availability: false
    )


    availabilities_structs << 
    OpenStruct.new(
      user_id: User.resisting_oracle.id,
      organization_id: Organization.indiana50501.id,
      date_start: Date.new(2025, 8, 3),
      date_end: Date.new(2025, 8, 10),
      user_id: User.resisting_oracle.id,
      availability: false
    )
    
    availabilities_structs << 
    OpenStruct.new(
      user_id: User.brian.id,
      organization_id: Organization.indiana50501.id,
      date_start: Date.new(2025, 5, 9),
      date_end: Date.new(2025, 5,9),
      availability: false
    )
    
    availabilities_structs << 
    OpenStruct.new(
      user_id: User.brian.id,
      organization_id: Organization.indiana50501.id,
      date_start: Date.new(2025, 5, 17),
      date_end: Date.new(2025, 5,17),
      availability: false
    )

    add_availabilities(availabilities_structs)
  end
  
  def add_availabilities(availabilities_structs) 
    availabilities_structs.each do |availabilities_struct|
      puts "Processing avilabilties ...#{availabilities_struct.user_id}"
      status, availability = Availability.find_or_create(availabilities_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Availability"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

