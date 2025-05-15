namespace :organizations do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake organizations:init --trace
  task :init => :environment do
    Rake::Task["organizations:seed2"].invoke
    Rake::Task["organizations:metrics"].invoke
  end
  
  task :seed2 => :environment do
    organizations = []
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501"
    )

    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 1",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district1"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 2",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district2"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 3",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district3"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 4",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district4"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 5",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district5"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 6",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district6"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 7",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district7"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 8",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district8_evansville_resistance"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Indiana 50501 District 9",
      state: "Indiana",
      organization_type: "collective",
      identifier: "indiana50501_district9"
    )
    
    organizations << 
    OpenStruct.new(
      name: "NWI Takes Action",
      state: "Indiana",
      organization_type: "facebook_group",
      identifier: "nwitakesaction"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Westside Democrats",
      state: "Indiana",
      organization_type: "collective",
      identifier: "westsidedemocrats"
    )
    
    organizations << 
    OpenStruct.new(
      name: "Westfield Democrats",
      state: "Indiana",
      organization_type: "collective",
      identifier: "westfield_democrats"
    )
    
    organizations << 
    OpenStruct.new(
      name: "We're Folking Mad",
      state: "Indiana",
      organization_type: "collective",
      identifier: "we_are_folking_mad"
    )

    add_organizations2(organizations)
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    splits = []
    splits << "name:Indiana 50501|state:Indiana|organization_type:collective|identifier:indiana50501"    
    splits << "name:NWI Takes Action|organization_type:facebook_group|identifier:nwitakesaction"
    splits << "name:Evansville Resistance / 50501 District 8|state:Indiana|organization_type:collective|identifier:evansville_resistance_district_8_50501"    
    splits << "name:50501 District 9|state:Indiana|organization_type:collective|identifier:district_9_50501"    
    splits << "name:Westside Democrats|organization_type:collective|identifier:westsidedemocrats"
    add_organizations(splits)
    splits << "name:Westfield Democrats|organization_type:collective|identifier:westfield_democrats"
    add_organizations(splits)
    splits << "name:We're Folking Mad|organization_type:collective|identifier:we_are_folking_mad"
    add_organizations(splits)
    
    
  end
  
  def add_organizations2(organizations)
    organizations.each do |organization|
      status, new_organization = Organization.find_or_create(organization)
    end
  end
  
  def add_organizations(splits) 
    splits.each do |split_text|
      puts "Processing split_text:\n   #{split_text}"
      hash = {}
      field_parts = split_text.split("|")
      field_parts.each do |field_part|
        field, field_value = field_part.split(":")
        hash[field] = field_value
      end
      os = OpenStruct.new(hash)
      status, group = Organization.find_or_create(os)
    end
  end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "Organization"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

