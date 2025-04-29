# namespace :contact_cards do
#
#   #bin/rails g scaffold Contact first_name:string last_name:string full_name:string company:string  city:string state:string congressional_district:integer county:string is_me:boolean organization:references user:references birthday:date birth_date:string birth_year:integer email_primary:string email_secondary:string phone_mobile:string phone_secondary:string signal_username:string discord_username:string discord_server:string url:string favorite_movie:string favorite_color:string favorite_coffee:string favorite_cocktail:string vip:boolean politician:boolean donor:boolean needs_attention:boolean notes:text history:text
#
#   #Add congressional district, county, town two user record or two is me aspect of contact record
#
#   # be rake teams:init --trace
#   task :init => :environment do
#     Rake::Task["contact_cards:seed"].invoke
#     Rake::Task["contact_cards:metrics"].invoke
#   end
#
#   # be rake contact_cards:seed --trace
#   task :seed => :environment do
#
#     contact_cards = []
#     contact_cards <<
#     OpenStruct.new(
#       first_name: "Jamie",
#       last_name: "Flemington",
#       company: "Westfield Democrats",
#       url: "https://www.westfielddemocrats.org/",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id,
#       phone_mobile: "(317) 363-7806‬",
#       history: "Found Scott @ a protest; got to know him; had him speak on 4/26 at Westfield Democrats; called Scott a 'celebrity'; peals of laughter",
#       active: true,
#       congressional_district: 5,
#       town: "Noblesville",
#       notes: "Offered to let us put up a local sign in her yard; good resource for hyperlocal work"
#     )
#
#     contact_cards <<
#     OpenStruct.new(
#       first_name: "Scott",
#       last_name: "Johnson",
#       company: "",
#       url: "https://linktr.ee/fuzzygroup",
#       is_me: true,
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id,
#       phone_mobile: "317 531 4853‬",
#       history: "",
#       active: true,
#       congressional_district: 5,
#       town: "Fishers",
#       signal_username: 'CancelTesla.2025'
#
#     )
#
#     contact_cards <<
#     OpenStruct.new(
#       first_name: "Brad",
#       last_name: "Lorton",
#       company: "Central Indiana DSA",
#       url: "https://www.centralindsa.org/",
#       is_me: false,
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id,
#       phone_mobile: "",
#       history: "FB friends with Scott; comes to all events; past speaker",
#       active: true,
#       congressional_district: 7,
#       town: "Indianapolis",
#       signal_username: ''
#     )
#
#
#
#     add_contacts(contacts_structs)
#   end
#
#   def add_contacts(contacts_structs)
#     contacts_structs.each do |contact_structs|
#       puts "Processing contact:\n   #{contact_struct.name}"
#
#       status, contacts = Contact.find_or_create(contact_struct)
#     end
#   end
#
#
#
#   # be rake user:metrics
#   task :metrics => :environment do
#     klass = "Contact"
#     puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
#   end
#
# end
#
