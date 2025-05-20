namespace :event_tasks do 
  
  KLASS = "EventTask"
  
  # be rake event_tasks:init --trace
  task :init => :environment do
    Rake::Task["event_tasks:seed"].invoke
    Rake::Task["event_tasks:metrics"].invoke
  end
  
  # be rake event_tasks:seed --trace
  task :seed => :environment do
    
    event_tasks_structs = []
    event_tasks_structs << 
    OpenStruct.new(
      event_id: Event.where(name: "5/17 Picnic").first.id,
      name: "Analyze prices for best value for picnic food",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id,
      done: true,
      url: "https://docs.google.com/spreadsheets/d/14F_Rc36Rhu6dNrc0lMv2deCvau-pnwnq2UAJdkhr_k4/edit?gid=0#gid=0"
      
    )
    
     #name:string event:references user:references team:references done:boolean body:text notes:text
    
    add_event_tasks(event_tasks_structs)
  end
  
  def add_event_tasks(event_tasks_structs) 
    event_tasks_structs.each do |event_task|
      puts "Processing #{KLASS.to_s}:\n   #{event_task.name}"
      status, event_task = EventTask.find_or_create(event_task)
      puts "Status = #{status} -- #{event_task.name}"
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    #klass = "EventTask"
    puts "For object: #{KLASS.to_s}, there are #{KLASS.constantize.count} objects in the database"
  end
  
end

