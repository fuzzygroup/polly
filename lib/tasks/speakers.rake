namespace :speakers do 
  
  #bin/rails g Speaker name:string url:string pronouns:string speaking_count:integer organization:references user:references contact:references bio:text wants_to_promote:text notes:text 
  
  # be rake speakers:init --trace
  task :init => :environment do
    Rake::Task["speakers:seed"].invoke
    Rake::Task["speakers:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    speaker_structs = []
    speaker_structs << 
    OpenStruct.new(
      name: "Jamie Flemington",
      url: "https://www.westfielddemocrats.org/",
      organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      contact_id: Contact.jamie_flemington.id,
      notes: "Wants to speak at May 25 on Trump's executive orders and Abortion Rights; suffered from an Ectopic pregnancy and would likely be DEAD under today's laws"
    )
  
    add_speakers(speaker_structs)
  end
  
  def add_speakers(speaker_structs) 
    speaker_structs.each do |speaker_struct|
      puts "Processing team:\n   #{speaker_structs.name}"

      status, speaker = Speaker.find_or_create(team_struct)
    end
  end
  

  
  # be rake speaker:metrics
  task :metrics => :environment do
    klass = "Speaker"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

