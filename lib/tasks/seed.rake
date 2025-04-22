namespace :seed do
  # bundle exec rake seed:init --trace
  task :init => :environment do
    #
    # Core setup data
    #
    Rake::Task["user:init"].invoke
    Rake::Task["user:account_init"].invoke
    Rake::Task["project_type:init"].invoke
    #Rake::Task["project_type:init"].invoke
    #Rake::Task["project_environment:init"].invoke
    Rake::Task["project:init"].invoke
    #Rake::Task["environment:init"].invoke
    # Rake::Task["project:init"].invoke
    Rake::Task["link:init"].invoke
    Project.set_link_color_gradients
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