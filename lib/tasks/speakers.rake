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
      identifier: "scott_johnson",
      is_me: true,
      bio: "Scott Johnson is the State Organizer for 50501 Indiana.  A software engineer with almost 40 years in tech, a writer with multiple published books, a father, a blogger and more, Scott's call sign is Roomba indicating his almost constant motion."
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Alisa Advani Brown",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.resisting_oracle.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "The One, The Only",
      identifier: "resisting_oracle",
      is_me: true,
      bio: "Alisa Advani Brown is ... The Resisting Oracle.  She is 50501's heavy hitter in terms of speakers being both constantly in demand and constantly brilliant.  Her speaking has now extended beyond 50501 to Indiana's Earth Day."
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Max Haddad",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.max_haddad.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "",
      identifier: "max_haddad",
      is_me: true,
      bio: ""
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Alex Hardy",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      user_id: User.alex_hardy.id,
      notes: "",
      identifier: "captain_crunch",
      is_me: true,
      bio: "I'm an Army veteran (25Q) who served from 2005 to 2010, including two deployments to Iraq during Operation Iraqi Freedom (OIF 5 & 7). After the military, I worked on the frontlines of the COVID-19 pandemic as a janitor at the Orlando VA Hospital. Over the years, I've worn many hats—writer, game designer, stand-up comedian, cocktail server, janitor, and Army IT specialist—gaining a diverse range of experiences that shape my perspective.
My commitment to understanding global issues has taken me abroad, including time in China studying water quality and three weeks in Bogotá, Colombia, examining the peace process between the Colombian government and FARC. Now, I'm focused on bringing long-overdue progressive policies to Indiana—policies rooted in justice, equity, and dignity. My mission is simple: More Rights, Not Less."
    )
    

    speaker_structs << 
    OpenStruct.new(
      name: "Jamie Flemington",
      url: "https://www.westfielddemocrats.org/",
      organization_id: Organization.westfield_democrats.id, 
      user_id: User.scott.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: "Wants to speak at May 25 on Trump's executive orders and Abortion Rights; suffered from an Ectopic pregnancy and would likely be DEAD under today's laws",
      identifier: "jamie_flemington",
      is_me: false,
      bio: ""
    )
    

    
    speaker_structs << 
    OpenStruct.new(
      name: "Someone from AARP on Senior Issues",
      url: "https://www.aarp.org",
      user_id: User.scott.id,
      notes: "",
      identifier: "aarp",
      is_me: false,
      bio: ""
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Destiny Wells",
      url: "",
      organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      #contact_id: ContactCard.jamie_flemington.id,
      notes: "Maybe get her to talk about Trump using executive orders to go after law firms",
      identifier: "destiny_wells",
      is_me: false,
      bio: ""
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
      identifier: "tbd_speaker",
      is_me: false,
      bio: ""
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
      identifier: "open_mic",
      is_me: false,
      bio: ""
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
      identifier: "david_hoffman",
      is_me: false,
      bio: ""
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
      identifier: "brian_jonasen",
      is_me: true,
      bio: ""
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
      identifier: "amy_k",
      is_me: true,
      bio: ""
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
      identifier: "renee_turner_pack",
      is_me: false,
      bio: ""
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
      identifier: "jackson_franklin",
      is_me: false,
      bio: ""
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
      identifier: "connie_karras",
      is_me: false,
      bio: ""
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
      identifier: "josh_lowry",
      is_me: false,
      bio: ""
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "J. D. Ford",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.amyk.id,
      #contact_id: nil,
      notes: nil,
      identifier: "j_d_ford",
      is_me: false,
      bio: ""
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
      identifier: "TBD",
      is_me: false,
      bio: ""
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
      identifier: "open_mic",
      is_me: false,
      bio: ""
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
      identifier: "sally",
      is_me: false,
      bio: ""
    )
    
    speaker_structs << 
    OpenStruct.new(
      name: "Bill Smith",
      url: nil,
      organization_id: Organization.indiana50501.id, 
      pronouns: nil,
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "Bill Smith is 50501's Legal Observer.  He attends every protest and is ever present to make sure that if Police get involved, the law is followed.  Bill is a local Indianapolis resident engaged in the fight against Fascism.",
      identifier: "bill_smith",
      is_me: false,
      bio: ""
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

