namespace :polls do 
  
  #bin/rails g scaffold BankDeposits name:string share_code:references user:references organization:references body:text

  # be rake bank_deposits:init --trace
  task :init => :environment do
    Rake::Task["bank_deposits:seed"].invoke
    Rake::Task["bank_deposits:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    bank_deposit_structs = []
    bank_deposit_structs << 
    OpenStruct.new(
      name: "swear_jar",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      body: "Thank you DeOnyae",  
      amount: 26.00,
      date_received: Date.new(2025,5,1),
      funds_type: "cash",
      event: Event.five_one
    )
    
    bank_deposit_structs << 
    OpenStruct.new(
      name: "tshirt sales",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      amount: 786.00,
      date_received: Date.new(2025,5,1),
      funds_type: "cash",
      event: Event.five_one
    )
    
    bank_deposit_structs << 
    OpenStruct.new(
      name: "donations",
      user_id: User.scott.id,
      organization_id: Organization.indiana50501.id, 
      amount: 82.00,
      date_received: Date.new(2025,4,19),
      funds_type: "cash",
      event: Event.four_nineteen
    )
    
    add_bank_deposits(bank_deposit_structs)
  end
  
  def add_bank_deposits(bank_deposit_structs) 
    bank_deposit_structs.each do |bank_deposit_struct|
      puts "Processing poll:\n   #{bank_deposit_struct.name}"
      
      status, bank_deposit = BankDeposit.find_or_create(bank_deposit_struct)
    end
  end
  

  # be rake user:metrics
  task :metrics => :environment do
    klass = "BankDeposit"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

