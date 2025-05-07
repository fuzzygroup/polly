namespace :seed do
  
  # -rw-r--r--@ 1 sjohnson  staff  1127 Oct 14  2022 seed.rake
  # -rw-r--r--@ 1 sjohnson  staff  1523 Apr 22 07:14 organizations.rake
  # -rw-r--r--@ 1 sjohnson  staff  2019 Apr 22 10:08 vetting_questions.rake
  # -rw-r--r--  1 sjohnson  staff  2013 Apr 24 15:22 fliers.rake
  # -rw-r--r--@ 1 sjohnson  staff  7361 Apr 24 15:22 rules.rake
  # -rw-r--r--@ 1 sjohnson  staff  7361 Apr 24 15:22 projects.rake
  # -rw-r--r--@ 1 sjohnson  staff  3543 Apr 24 17:23 users.rake
  # drwxr-xr-x  6 sjohnson  staff   192 Apr 25 10:39 data
  # -rw-r--r--@ 1 sjohnson  staff  2702 Apr 26 12:43 event_types.rake
  # -rw-r--r--@ 1 sjohnson  staff  1569 Apr 27 00:14 teams.rake
  # -rw-r--r--@ 1 sjohnson  staff  1361 Apr 27 03:51 speakers.rake
  # -rw-r--r--@ 1 sjohnson  staff  3124 Apr 27 09:45 contacts.rake
  
  # bundle exec rake seed:init --trace
  task :init => :environment do
    #
    # Core setup data
    #
    Rake::Task["generate_passwords_env_file:init"].invoke
    Rake::Task["organization:init"].invoke
    Rake::Task["user:init"].invoke
    Rake::Task["vetting_questions:init"].invoke
    Rake::Task["fliers:init"].invoke
    Rake::Task["rules:init"].invoke
    Rake::Task["projects:init"].invoke
    Rake::Task["event_types:init"].invoke
    Rake::Task["teams:init"].invoke
    Rake::Task["team_users:init"].invoke
    Rake::Task["speakers:init"].invoke
    Rake::Task["contact_cards:init"].invoke
    Rake::Task["rules:init"].invoke
    Rake::Task["organization_rules:init"].invoke
    Rake::Task["team_rules:init"].invoke
    Rake::Task["team_user_rules:init"].invoke
    
    Rake::Task["political_actions:init"].invoke
    Rake::Task["bank_deposits:init"].invoke
    Rake::Task["event_slot_types:init"].invoke
    Rake::Task["event_slots:init"].invoke
    Rake::Task["events:init"].invoke
    Rake::Task["polls:init"].invoke
    Rake::Task["poll_options:init"].invoke
    Rake::Task["teams:init"].invoke
    Rake::Task["team_users:init"].invoke
    
    #Rake::Task["project_environment:init"].invoke
    # Rake::Task["project:init"].invoke
    # #Rake::Task["environment:init"].invoke
    # # Rake::Task["project:init"].invoke
    # Rake::Task["link:init"].invoke
    # Project.set_link_color_gradients
    #Rake::Task["note:init"].invoke
    # Rake::Task["chemical:init"].invoke
    # Rake::Task["chemical_ph_dosage:init"].invoke
    # Rake::Task["task:init"].invoke
    # Rake::Task["pool:init"].invoke
    # Rake::Task["water_measurement:init"].invoke
    # Rake::Task["chemical_addition:init"].invoke
  end
  
  # be rake seed:metrics --trace
  task :metrics => :environment do
    klasses = [WaterChemistryType, ChemicalType, Chemical, ChemicalPhDosage, Task, Pool, WaterMeasurement, ChemicalAddition]
    klasses.each do |klass|
      puts "#{klass.name} -- #{klass.count}"
    end
  end
end