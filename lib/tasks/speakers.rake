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
      name: "Scott Johnson",
      url: "https://www.linktr.ee/fuzzygroup",
      organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "The Scott",
      identifier: "scott_johnson"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Alisa Advani Brown",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.resisting_oracle.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "The One, The Only",
      identifier: "resisting_oracle"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Max Haddad",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.max_haddad.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "",
      identifier: "max_haddad"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Alex Hardy",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.alex_hardy.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "",
      identifier: "captain_crunch"
    )
    

    speaker_structs << 
    OpenStruct.new(
      name: "Jamie Flemington",
      url: "https://www.westfielddemocrats.org/",
      organization_id: Organization.westfield_democrats.id, 
      user_id: User.scott.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "Wants to speak at May 25 on Trump's executive orders and Abortion Rights; suffered from an Ectopic pregnancy and would likely be DEAD under today's laws",
      identifier: "jamie_flemington"
    )
    

    
    speaker_structs << 
    OpenStruct.new(
      name: "Someone from AARP on Senior Issues",
      url: "https://www.aarp.org",
      user_id: User.scott.id,
      notes: "",
      identifier: "aarp"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Destiny Wells",
      url: "",
      organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      #contact_id: ContactCard.jamie_flemington.id,
      notes: "Maybe get her to talk about Trump using executive orders to go after law firms",
      identifier: "destiny_wells"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "TBD Speaker",
      url: "",
      organization_id: Organization.indiana50501.id, 
      pronouns: "they / them",
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "This is a speaker still to be found",
      identifier: "tbd_speaker"
    )
    
    # speaker_structs <<
    # OpenStruct.new(
    # name: "GallifreyanValkyrie")
  
    add_speakers(speaker_structs)
  end
  
  def add_speakers(speaker_structs) 
    speaker_structs.each do |speaker_struct|
      puts "Processing Speaker:\n   #{speaker_struct.name}"

      status, speaker = Speaker.find_or_create(speaker_struct)
    end
  end



  # be rake speaker:metrics
  task :metrics => :environment do
    klass = "Speaker"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

