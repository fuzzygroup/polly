namespace :poll_options do 
  
  # bin/rails g scaffold PollOption name:string poll:references widget_type:string value:string body:text
  
  # be rake poll_options:init --trace
  task :init => :environment do
    Rake::Task["poll_options:seed"].invoke
    Rake::Task["poll_options:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    poll = Poll.attend_517
    
    poll.add_option('yes', 'radio', 'yes', 'Yes I will be there')
    poll.add_option('no', 'radio', 'no', 'Nope I haz plans')
    poll.add_option('maybe', 'radio', 'maybe', 'I am not sure')
    
  end
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "PollOption"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

