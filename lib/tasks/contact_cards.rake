namespace :contact_cards do

  #bin/rails g scaffold Contact first_name:string last_name:string full_name:string company:string  city:string state:string congressional_district:integer county:string is_me:boolean organization:references user:references birthday:date birth_date:string birth_year:integer email_primary:string email_secondary:string phone_mobile:string phone_secondary:string signal_username:string discord_username:string discord_server:string url:string favorite_movie:string favorite_color:string favorite_coffee:string favorite_cocktail:string vip:boolean politician:boolean donor:boolean needs_attention:boolean notes:text history:text

  #Add congressional district, county, town two user record or two is me aspect of contact record

  # be rake teams:init --trace
  task :init => :environment do
    Rake::Task["contact_cards:seed"].invoke
    Rake::Task["contact_cards:metrics"].invoke
  end

  # be rake contact_cards:seed --trace
  task :seed => :environment do

    contact_cards = []
    contact_cards <<
    OpenStruct.new(
      first_name: "Taelar",
      last_name: "",
      company: "",
      url: "https://indiana50501.org/",
      user_id: User.taelar.id,
      organization_id: Organization.indiana50501.id,
      phone_mobile: "‬",
      history: "",
      active: true,
      congressional_district: 5,
      town: "Franklin",
      notes: "",
      favorite_cocktail: "margarita",
      is_me: false
    )
    
    contact_cards <<
    OpenStruct.new(
      first_name: "Angie",
      last_name: "Foreman",
      company: "A Foreman Designs",
      url: "https://aforemandesigns.com/",
      email: "aforemandesigns@gmail.com",
      user_id: nil,
      organization_id: Organization.indiana50501.id,
      phone_mobile: "‬317 508 0266",
      history: "",
      active: true,
      congressional_district: 5,
      town: "Noblesville",
      notes: "",
      favorite_cocktail: "",
      notes: "Organizer for Dads for Democracy",
      is_me: false
    )

    # contact_cards <<
    #   OpenStruct.new(
    #     first_name: "Cameron",
    #     last_name: "Stuart",
    #     company: "",
    #     url: "",
    #     is_me: true,
    #     user_id: User.tori.id,
    #     organization_id: Organization.indiana50501.id,
    #     phone_mobile: "317 770 3327",
    #     email: "cameron_d_stuart@keybank.com"
    #     history: "",
    #     active: true,
    #     congressional_district: 0,
    #     town: "",
    #     signal_username: '',
    #     notes: "Our banker; was at 4/5. Leans left.  Possible speaker on economic issues"
    #   )
    #
    #
    # contact_cards <<
    #
    # OpenStruct.new(
    #   first_name: "Jamie",
    #   last_name: "Flemington",
    #   company: "Westfield Democrats",
    #   url: "https://www.westfielddemocrats.org/",
    #   user_id: User.scott.id,
    #   organization_id: Organization.indiana50501.id,
    #   phone_mobile: "(317) 363-7806‬",
    #   history: "Found Scott @ a protest; got to know him; had him speak on 4/26 at Westfield Democrats; called Scott a 'celebrity'; peals of laughter",
    #   active: true,
    #   congressional_district: 5,
    #   town: "Noblesville",
    #   notes: "Offered to let us put up a local sign in her yard; good resource for hyperlocal work"
    # )
    #
    # contact_cards <<
    #
    # OpenStruct.new(
    #   first_name: "Scott",
    #   last_name: "Johnson",
    #   company: "",
    #   url: "https://linktr.ee/fuzzygroup",
    #   is_me: true,
    #   user_id: User.scott.id,
    #   organization_id: Organization.indiana50501.id,
    #   phone_mobile: "317 531 4853‬",
    #   history: "",
    #   active: true,
    #   congressional_district: 5,
    #   town: "Fishers",
    #   signal_username: 'CancelTesla.2025'
    #
    # )
    #
    # contact_cards <<
    #   OpenStruct.new(
    #     first_name: "Brad",
    #     last_name: "Lorton",
    #     company: "Central Indiana DSA",
    #     url: "https://www.centralindsa.org/",
    #     is_me: false,
    #     user_id: User.scott.id,
    #     organization_id: Organization.indiana50501.id,
    #     phone_mobile: "",
    #     history: "FB friends with Scott; comes to all events; past speaker",
    #     active: true,
    #     congressional_district: 7,
    #     town: "Indianapolis",
    #     signal_username: ''
    #   )
    #
    #   contact_cards <<
    #     OpenStruct.new(
    #       first_name: "Tori",
    #       last_name: "",
    #       company: "",
    #       url: "",
    #       is_me: true,
    #       user_id: User.tori.id,
    #       organization_id: Organization.indiana50501.id,
    #       phone_mobile: "",
    #       history: "",
    #       active: true,
    #       congressional_district: 0,
    #       town: "",
    #       signal_username: ''
    #     )
    #
    #     contact_cards <<
    #       OpenStruct.new(
    #         first_name: "Jen",
    #         last_name: "Carlson Midkiff",
    #         company: "",
    #         url: "https://www.heart2harp.com/",
    #         is_me: true,
    #         user_id: User.scott.id,
    #         organization_id: Organization.indiana50501.id,
    #         phone_mobile: "317 748 7765",
    #         history: "",
    #         active: true,
    #         congressional_district: 5,
    #         town: "",
    #         signal_username: '',
    #         notes: "Best damn musician around"
    #       )
    #
    #   contact_cards <<
    #     OpenStruct.new(
    #       first_name: "Rise",
    #       last_name: "Up",
    #       company: "",
    #       url: "",
    #       is_me: false,
    #       user_id: User.scott.id,
    #       organization_id: Organization.indiana50501.id,
    #       phone_mobile: "",
    #       history: "",
    #       active: true,
    #       congressional_district: 0,
    #       town: "",
    #       signal_username: 'RiseUp',
    #       ao_notes: "Long conversation on 4/30 with Scott where he expressed sympathy with PSL and was VERY concerned about how Scott failed to show protestor to protestor solidarity.  He finished the conversation by saying how 50501 DOES NOT HAVE TO ALWAYS SAY THEY ARE NON VIOLENT"
    #     )
    #
    #     contact_cards <<
    #       OpenStruct.new(
    #         first_name: "Jacquelyn",
    #         last_name: "M",
    #         company: "",
    #         url: "",
    #         is_me: false,
    #         user_id: User.scott.id,
    #         organization_id: Organization.indiana50501.id,
    #         phone_mobile: "⁨(213) 456-0820⁩",
    #         history: "",
    #         active: true,
    #         congressional_district: 7,
    #         town: "",
    #         signal_username: 'Jacquelyn M⁩',
    #         notes: "Likes KRAKEN run.  No mushrooms.  No hot peppers.  Loves the Beatles.  Loves BOWIE. Favprite bowie album: labyrinth sound tracl"
    #       )
    #
    #       contact_cards <<
    #         OpenStruct.new(
    #           first_name: "Anthony",
    #           last_name: "Burkhalter",
    #           company: "UHAUL / The Mower Shop",
    #           url: "",
    #           is_me: false,
    #           user_id: User.scott.id,
    #           organization_id: Organization.indiana50501.id,
    #           phone_mobile: "⁨317 849 9500",
    #           email: "aburkhalter@themowershop.com"
    #           history: "",
    #           active: true,
    #           congressional_district: 0,
    #           town: "",
    #           signal_username: '',
    #           notes: "Rented us our truck for 4/19. Served with Jackson.  Conservative but concerned and thinking.  "
    #         )



    add_contacts(contacts_structs)
  end

  def add_contacts(contacts_structs)
    contacts_structs.each do |contact_structs|
      puts "Processing contact:\n   #{contact_struct.name}"

      status, contacts = Contact.find_or_create(contact_struct)
    end
  end



  # be rake user:metrics
  task :metrics => :environment do
    klass = "Contact"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end

end

