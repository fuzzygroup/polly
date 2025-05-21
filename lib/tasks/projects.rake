namespace :projects do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake projects:init --trace
  task :init => :environment do
    Rake::Task["projects:seed"].invoke
    Rake::Task["projects:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    project_structs = []
    project_structs << 
    OpenStruct.new(
      name: "Use a veteran in uniform to collect toothbrushes outside dentist offices for HVAF",
      user_id: User.brian.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "charitable_work"
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Use a veteran in uniform to collect Menard's receipts outside Menards for HVAF",
      user_id: User.brian.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "charitable_work"
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Distribute whistles on lanyards to restaurant workers",
      user_id: User.sara.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "charitable_work",
      due_date: Date.new(2025,6,15)
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Establish a relationship with a Latino food charity",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "charitable_work",
      due_date: Date.new(2025,5,20)
    )
  
    project_structs << 
    OpenStruct.new(
      name: "Organize a General Strike",
      user_id: User.morgan.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "resistance",
      due_date: Date.new(2025,7,30)
    )
    
    
    project_structs << 
    OpenStruct.new(
      name: "Make Up 50501 Buttons at a Public Library",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "marketing",
      active: false
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Get a Tiger Team Team B Established ",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "leadership",
      due_date: Date.new(2025, 5, 24),
      active: true
    )
    
    project_structs << 
    OpenStruct.new(
      name: "CiberTruck Challenge Videos",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "leadership",
      active: true,
      
    )

    project_structs << 
    OpenStruct.new(
      name: "Make Sign Lanyards using Cord and Alligator Clips to Give Away",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "crafts",
      active: false      
    )

    project_structs << 
    OpenStruct.new(
      name: "Make Executive Order Binders Like Project 2025 Binders",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "props",
      active: true,
      due_date: Date.new(2025, 5, 24)
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Make Giant Milk Carton",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "props",
      due_date: Date.new(2025, 3,15),
      active: false
    )

    project_structs << 
    OpenStruct.new(
      name: "Chairs for the Disappeared",
      user_id: User.sara.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "props",
      due_date: Date.new(2025, 4,30),
      active: true
      
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Stage",
      user_id: User.amyk.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "props", 
      due_date: Date.new(2025, 4,30),
      active: true 
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Stickers",
      body: "Get in touch with Lucy out of Pittsburgh.  Lucy found great sticker pricing out of MinuteMan and wanted to do anti trump stickers but got busy https://minuteman.com/us/locations/in/#8/40.675/-86.752",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "marketing", 
      due_date: Date.new(2025, 5,24),
      active: true 
    )
    
    project_structs << 
    OpenStruct.new(
      name: "5/1 Event - SMASH",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "event", 
      due_date: Date.new(2025, 4,30),
      active: true 
    )

    project_structs << 
    OpenStruct.new(
      name: "5/17 Event - The Social",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "event", 
      due_date: Date.new(2025, 5,16),
      active: true 
    )
    
    project_structs << 
    OpenStruct.new(
      name: "5/25 Event - The VROOM VROOM",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "event", 
      due_date: Date.new(2025, 5,24),
      active: true 
    )
    
    project_structs << 
    OpenStruct.new(
      name: "Paint the Collection Tarp the State Outline and Something Else",
      user_id: User.jacqui.id,
      organization_id: Organization.indiana50501.id, 
      project_type: "marketing", 
      due_date: Date.new(2025, 4,27),
      active: true 
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
    klass = "Project"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

