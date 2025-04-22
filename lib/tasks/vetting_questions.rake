namespace :vetting_questions do 
  
  #rails g scaffold Organization name:string city:string state:string location:string organization_type:string
  
  # be rake organizations:init --trace
  task :init => :environment do
    Rake::Task["vetting_questions:seed"].invoke
    Rake::Task["vetting_questions:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    splits = []
    splits << "body:What is your Congressional District?|user_id:#{User.scott.id}"    
    splits << "body:What do you like to do?|user_id:#{User.scott.id}"
    splits << "body:What are you good at?|user_id:#{User.scott.id}"
    splits << "body:What makes you angriest about Trump 2.0?|user_id:#{User.scott.id}"
    splits << "body:How much time do you have available?|user_id:#{User.scott.id}"
    splits << "body:What is your phone number?|user_id:#{User.scott.id}"
    splits << "body:What is your email address?|user_id:#{User.scott.id}"
    splits << "body:How did you find us?|user_id:#{User.taelar.id}"
    splits << "body:What is your why?|user_id:#{User.taelar.id}"
    splits << "body:How do you want to get involved (more information or more volunteer)?|user_id:#{User.taelar.id}"
    splits << "body:Have you conducted a risk assessment?|user_id:#{User.taelar.id} "
    add_vetting_questions(splits)
  end
  
  def add_vetting_questions(splits) 
    splits.each do |split_text|
      puts "Processing split_text:\n   #{split_text}"
      hash = {}
      field_parts = split_text.split("|")
      field_parts.each do |field_part|
        field, field_value = field_part.split(":")
        hash[field] = field_value
      end
      os = OpenStruct.new(hash)
      os.organization_id = Organization.indiana50501.id
      status, vetting_question = VettingQuestion.find_or_create(os)
    end
  end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "VettingQuestion"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

