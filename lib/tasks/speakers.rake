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
    
    speaker_structs << 
    OpenStruct.new(
      name: "Open Mic",
      url: "",
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "This is an Open Mic block",
      identifier: "open_mic"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "David Hoffman",
      url: "",
      organization_id: Organization.indiana50501.id, 
      pronouns: "he / him",
      user_id: User.amyk.id,
      #contact_id: nil,
      notes: "Retired Colonel, History Teacher - Introduced by Amy",
      identifier: "david_hoffman"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Brian Jonasen",
      url: "",
      organization_id: Organization.indiana50501.id, 
      pronouns: "he / him",
      user_id: User.brian.id,
      #contact_id: nil,
      notes: nil,
      identifier: "brian_jonasen"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Amy Kleyla",
      url: "",
      organization_id: Organization.indiana50501.id, 
      pronouns: "he / him",
      user_id: User.amyk.id,
      #contact_id: nil,
      notes: nil,
      identifier: "amy_k"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Renee Turner Pack",
      url: "https://iga.in.gov/legislative/2024/legislators/legislator_renee_pack_1",
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.brian.id,
      #contact_id: nil,
      notes: "State Representative",
      identifier: "renee_turner_pack"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Jackson Franklin",
      url: "https://jacksonfranklinforcongress.com/",
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.brian.id,
      #contact_id: nil,
      notes: nil,
      identifier: "jackson_franklin"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Connie Karras",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.brian.id,
      #contact_id: nil,
      notes: nil,
      identifier: "connie_karras"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Josh Lowry",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.angie_foreman.id,
      #contact_id: nil,
      notes: nil,
      identifier: "josh_lowry"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "J. D. Ford",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: nil,
      identifier: "j_d_ford"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "TBD",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: nil,
      identifier: "TBD"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Open Mic",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: nil,
      identifier: "open_mic"
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Sally Alsmeyer",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "Sally Alsmeyer is a 16 year old poet who attends the 50501 protests and feels strongly about the direction of our country",
      identifier: "sally"
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

