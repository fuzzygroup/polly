namespace :users do 
  # be rake users:init --trace
  task :init => :environment do
    Rake::Task["users:seed"].invoke
    #Rake::Task["users:seed2"].invoke
    Rake::Task["users:metrics"].invoke
  end
  
  task :fix_hippie_and_cody => :environment do
    u = User.find()
  end
  
  task :seed2 => :environment do
    user_structs = []
    
    user_structs <<
    OpenStruct.new(
      first_name: "Anne",
      last_name: "Edwards",
      password: "sbi2025why!",
      username: "anne",
      email: "anneedwards@tutamail.com",
      #signal_username: "Anne Edwards⁩",
      role: "user",
      organization_id: Organization.indiana50501.id
    )
    
    user_structs <<
    OpenStruct.new(
      first_name: "Brigid",
      last_name: "Joy",
      password: "243ldsafsa!",
      username: "brigid",
      email: "brigid@foo.com",
      #signal_username: "⁨Brigid Joy⁩",
      role: "user",
      organization_id: Organization.indiana50501.id
    )
    
    user_structs <<
    OpenStruct.new(
      first_name: "Bryan⁩",
      last_name: "",
      password: "4329458asf!",
      username: "bryan⁩",
      email: "Bryan⁩@foo.com",
      #signal_username: "⁨Bryan⁩",
      role: "user",
      organization_id: Organization.indiana50501.id
    )
    
    user_structs <<
    OpenStruct.new(
      first_name: "Whitney⁩",
      last_name: "",
      password: "fdsafdasfsa!",
      username: "whitney⁩",
      email: "whitney⁩@foo.com",
      #signal_username: "⁨Whitney first aid & marketing⁩⁩",
      role: "user",
      organization_id: Organization.indiana50501.id
    )
    
    user_structs <<
    OpenStruct.new(
      first_name: "Bri⁩",
      last_name: "Hall",
      password: "afdsafas!",
      username: "bri⁩",
      email: "bri⁩@foo.com",
      #signal_username: "⁨Aphrodite⁩",
      role: "user",
      organization_id: Organization.indiana50501.id
    )
    
    add_users(user_structs)
  end
  
  def add_users(user_structs) 
    user_structs.each do |user_struct|
      puts "Processing user: #{user_struct.first_name}"
      status, user = User.find_or_create(user_struct)
    end
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    splits = []
    splits <<   "first_name:Scott|last_name:Johnson|username:fuzzygroup|password:dd3344!|email:fuzzygroup@tutamail.com|role:superuser|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Taelar|last_name:Christman|username:taelar|password:christmas3334|email:Yogitaelar@tutamail.com |role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Janet|last_name:Wall-Myers|username:janet|password:Halloween2022|email:janatheshort@yahoo.com|role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Tori|last_name:McQueen|username:tori|password:Dragon2023!|email:tori.e.mcqueen@gmail.com|role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Morgan|last_name:Mullins|username:morgan|password:Halloween2025|email:Mcmullins92@proton.me|role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Christina |last_name:|username:helpfulhippie|password:Dragon2023!|email:helpfulhippie@gmail.com|role:admin|email:foo@bar.com|organization_id:#{Organization.indiana50501_district8_evansville_resistance.id}"
    
    splits << "first_name:Kim |last_name:Saylor|username:belladonna|password:TransRights2025!|role:volunteer|email:belladonnanightshade@tutamail.com|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Cody |last_name:Unknown|username:cody|password:bloomingtonrocked!|email:Cody.hutcherson11@gmail.com|role:admin|organization_id:#{Organization.district_9_50501.id}"
    
    splits << "first_name:Brian|last_name:Jonaesen|username:brian|password:veterans50501!|email:brian.s.jonasen@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Amy|last_name:Kleyla|username:amyk|password:seabees50501!|email:Ames3588@tuta.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Kayla|last_name:McGuire|username:pride|password:pride123!|email:kaylamcguire91@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Sara|last_name:|username:sara|password:fuckice!|email:sara-idont-know@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Jacqui|last_name:|username:jacqui|password:oyveylife!|email:jackie-idont-know@gmail.com|role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Alisa|last_name:Advani|username:resisting_oracle|password:MatrixForever!|email:alias@something.com|role:admin|organization_id:#{Organization.indiana50501.id}"
        
        splits << "first_name:Lori|last_name:Daughtery|username:lorid|password:I_help_out!|email:alias111@something.com|role:user|organization_id:#{Organization.indiana50501.id}"
            
    splits << "first_name:Mary|last_name:Hardin|username:maryhardin|password:PRisLife!|email:alias222@something.com|role:user|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Dave|last_name:L|username:dgl|password:battery3333!|email:aliasdgl@something.com|role:user|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Max|last_name:Maddad|username:maxhaddad|password:comedy333!|email:comedy@something.com|role:user|organization_id:#{Organization.indiana50501.id}"
    
        splits << "first_name:Alex|last_name:Hardy|username:captaincrunch|password:crunchberries4ever!|email:crunc@something.com|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Ryan|last_name:|username:ryan|password:movies4ever!|email:rtmeacham@gmail.comm|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Angie|last_name:Foreman|username:angie|password:dadsrule!|email:aforemandesigns@gmail.com 
|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Bri|last_name:Hall|username:bri|password:fdfdfdfdaaa!|email:bri@foo.com 
|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Jen|last_name:Carlson Midkiff|username:jenmidkiff|password:harpistrule!|email:jenmidkiff@foo.com 
|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Gallifreyan|last_name:Valkyrie |username:gallifreyanvalkyrie|password:tardistobattle!|email:gallifreyanvalkyrie@foo.com 
|role:user|organization_id:#{Organization.indiana50501.id}"

        splits << "first_name:Aric|last_name:Maddox |username:aric|password:piforever32p!|email:madducks@gmail.com 
|role:admin|organization_id:#{Organization.indiana50501.id}"



    
    add_user(splits)
  end
  
  def add_user(splits) 
    splits.each do |split_text|
      puts "Processing split_text:\n   #{split_text}"
      hash = {}
      field_parts = split_text.split("|")
      field_parts.each do |field_part|
        field, field_value = field_part.split(":")
        hash[field] = field_value
      end
      os = OpenStruct.new(hash)
      #debugger
      #os.organization_id = Organization.indiana50501.id
      #os.terms_of_service = true
      #debugger if os.username == 'jacqui'
      status, user = User.find_or_create(os)
      if user
        #user.update_column(:otp_backup_codes, [hash["password"]])
      end
    end
  end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "User"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

