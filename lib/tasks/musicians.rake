namespace :musicians do 
  
  #bin/rails g Speaker name:string url:string pronouns:string speaking_count:integer organization:references user:references contact:references bio:text wants_to_promote:text notes:text 
  
  # be rake musicians:init --trace
  task :init => :environment do
    Rake::Task["musicians:seed"].invoke
    Rake::Task["musicians:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    musician_structs = []

    musician_structs << 
    OpenStruct.new(
      name: "Dave McCarty",
      url: nil,
      #organization_id: Organization.we_are_folking_mad.id, 
      user_id: User.scott.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: nil,
      identifier: "dave_mccarty"
    )
    
    musician_structs << 
    OpenStruct.new(
      name: "Greg Ziesemer",
      url: nil,
      #organization_id: Organization.we_are_folking_mad.id, 
      user_id: User.scott.id,
      #contact_id: Contact.jamie_flemington.id,
      notes: nil,
      identifier: "greg_ziesemer"
    )
    
    musician_structs << 
    OpenStruct.new(
      name: "Jen Carlson Midkiff",
      url: "https://www.facebook.com/harpist.jen.midkiff/",
      user_id: User.scott.id,
      notes: nil,
      identifier: "jen_carlson_midkiff"
    )
    
    musician_structs << 
    OpenStruct.new(
      name: "TBD",
      url: "",
      #organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "This is a musician still to be found",
      identifier: "tbd"
    )
    
    musician_structs << 
    OpenStruct.new(
      name: "James Kinsey",
      url: "",
      #organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      #contact_id: nil,
      notes: "James Kinsey is a long time 50501 member, a poet, an avid Cards Against Humanity player, a lyricist and a performer",
      identifier: "james"
    )
    

    
    # musician_structs <<
    # OpenStruct.new(
    # name: "GallifreyanValkyrie")
  
    add_musicians(musician_structs)
  end
  
  def add_musicians(musician_structs) 
    musician_structs.each do |musician_struct|
      puts "Processing team:\n   #{musician_struct.name}"

      status, musician = Musician.find_or_create(musician_struct)
    end
  end



  # be rake musician:metrics
  task :metrics => :environment do
    klass = "Musician"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

