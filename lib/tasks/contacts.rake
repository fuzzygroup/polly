namespace :contacts do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake projects:init --trace
  task :init => :environment do
    Rake::Task["contacts:seed"].invoke
    Rake::Task["contacts:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    contact_structs = []
    contact_structs << 
    OpenStruct.new(
      first_name: "Hollie",
      user_id: User.janet.id,
      organization_id: Organization.indiana50501.id, 
      contact_type: "interview_to_do", 
      phone_number: "812 560 0744",
      notes: "autistic child"
      
    )
    


    
    # splits = []
    # splits << "name:Use a veteran in uniform to collect toothbrushes outside dentist offices for HVAF|user_id: #{User.brian.id}"
    # splits << "name:Use a veteran in uniform to collect Menard's receipts outside Menards for HVAF|user_id: #{User.brian.id}"
    # splits << "name:Distribute whistles on lanyards to restaurant workers|user_id: #{User.sara.id}"
    # splits << "name:Establish a relationship with a POC food charity|user_id: #{User.scott.id}"
    # splits << "name:Establish a relationship with a Latino food charity|user_id: #{User.scott.id}"
    # splits << "name:Organize a General Strike|user_id: #{User.morgan.id}"
    add_projects(project_structs)
  end
  
  def add_projects(project_structs) 
    project_structs.each do |project_struct|
      puts "Processing project:\n   #{project_struct.name}"
      # hash = {}
      # field_parts = split_text.split("|")
      # field_parts.each do |field_part|
      #   field, field_value = field_part.split(":")
      #   hash[field] = field_value
      # end
      # os = OpenStruct.new(hash)
      # os.organization_id = Organization.indiana50501.id
      status, project = Project.find_or_create(project_struct)
    end
  end
  
  # def add_projects(splits)
  #   splits.each do |split_text|
  #     puts "Processing split_text:\n   #{split_text}"
  #     hash = {}
  #     field_parts = split_text.split("|")
  #     field_parts.each do |field_part|
  #       field, field_value = field_part.split(":")
  #       hash[field] = field_value
  #     end
  #     os = OpenStruct.new(hash)
  #     os.organization_id = Organization.indiana50501.id
  #     status, vetting_question = VettingQuestion.find_or_create(os)
  #   end
  # end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Contact"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

