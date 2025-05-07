namespace :organization_rules do 
  
  # be rake organization_rules:init --trace
  task :init => :environment do
    Rake::Task["organization_rules:seed"].invoke
    Rake::Task["organization_rules:metrics"].invoke
  end
  
  # be rake organization_rules:seed --trace
  task :seed => :environment do
    
    organization_rules_structs = []
    organization_rules_structs << 
    OpenStruct.new(
      organization_id: Organization.indiana50501.id,
      rule_id: Rule.non_violence.id,
      active: true
    )

    add_organization_rules(organization_rules_structs)
  end
  
  def add_organization_rules(organization_rules_structs) 
    organization_rules_structs.each do |organization_rule_struct|
      puts "Processing rule ..."
      status, rule = OrganizationRule.find_or_create(organization_rule_struct)
    end
  end
  
  
  # be rake user:metrics
  task :metrics => :environment do
    klass = "OrganizationRule"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

