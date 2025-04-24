namespace :fliers do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake fliers:init --trace
  task :init => :environment do
    Rake::Task["fliers:seed"].invoke
    Rake::Task["fliers:metrics"].invoke
  end
  
  # be rake fliers:seed --trace
  task :seed => :environment do
    names = {}
    names['2025_05_17_save_the_date.jpeg'] = 'first damn speakers flier'
    names['shred_project_2025.jpeg'] = 'Shred Project 2025'
    names['signal-2025-04-08-153147.jpeg'] = 'April 19 Not Paid Protestors'
    names['signal-2025-04-08-153147.jpeg'] = 'April 19 Not Paid Protestors'
    names['signal-2025-04-10-102844.jpeg'] = 'May Day Smash'
    
    flier_structs = []
    
    files = Dir.glob(File.join(Rails.root, "lib/tasks/data/fliers/*"))
    
    files.each do |file|
      flier_structs << 
        OpenStruct.new(
          name: names[File.basename(file)],
          user_id: User.tori.id,
          organization_id: Organization.indiana50501.id,
          image: file
        )
    end

    add_fliers(flier_structs)
  end
  
  def add_fliers(flier_structs) 
    flier_structs.each do |flier_struct|
      puts "Processing flier:\n   #{flier_struct.name}"
      status, flier = Flier.find_or_create(flier_struct)
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
    klass = "Flier"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

