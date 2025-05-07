namespace :users do 
  # be rake users:init --trace
  task :init => :environment do
    Rake::Task["users:seed"].invoke
    Rake::Task["users:metrics"].invoke
  end
  
  task :fix_hippie_and_cody => :environment do
    u = User.find()
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    splits = []
    splits << #"first_name:Scott|last_name:Johnson|username:fuzzygroup|password:dd87934aadfed!|email:fuzzygroup@gmail.com|signal_username:CancelTesla.2025|role:superuser"
    "first_name:Scott|last_name:Johnson|username:fuzzygroup|password:dd87934aadfed!|email:fuzzygroup@gmail.com|role:superuser|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Taelar|last_name:Christman|username:taelar|password:christmas3334|email:Taelar.christman@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Janet|last_name:Wall-Myers|username:janet|password:Halloween2022|email:janatheshort@yahoo.com|role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Tori|last_name:McQueen|username:tori|password:Dragon2023!|email:tori.e.mcqueen@gmail.com|role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Morgan|last_name:Mullins|username:morgan|password:Halloween2025|email:Mcmullins92@proton.me|role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Christina |last_name:|username:helpfulhippie|password:Dragon2023!|email:helpfulhippie@gmail.com|role:admin|email:foo@bar.com|organization_id:#{Organization.district_8_50501.id}"
    
    splits << "first_name:Kim |last_name:Saylor|username:belladonna|password:TransRights2025!|role:volunteer|email:belladonnanightshade@tutamail.com|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Cody |last_name:Unknown|username:cody|password:bloomingtonrocked!|email:Cody.hutcherson11@gmail.com|role:admin|organization_id:#{Organization.district_9_50501.id}"
    
    splits << "first_name:Brian|last_name:Jonaesen|username:brian|password:veterans50501!|email:brian.s.jonasen@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Amy|last_name:Kleyla|username:amyk|password:seabees50501!|email:Ames3588@tuta.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Kayla|last_name:McGuire|username:pride|password:pride123!|email:kaylamcguire91@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"
    
    splits << "first_name:Sara|last_name:|username:sara|password:fuckice!|email:sara-idont-know@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"

    splits << "first_name:Jacqui|last_name:|username:jacqui|password:oyveylife!|email:jackie-idont-know@gmail.com |role:admin|organization_id:#{Organization.indiana50501.id}"
    
        
    
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

