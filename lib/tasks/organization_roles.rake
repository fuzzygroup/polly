# namespace :organization_roles do
#
#   KLASS = "OrganizationRole"
#
#   #rails g scaffold OrganizationRole name:string user:references team:references job_description:text status:string
#
#   # be rake organization_roles:init --trace
#   task :init => :environment do
#     Rake::Task["organization_roles:seed"].invoke
#     Rake::Task["organization_roles:metrics"].invoke
#   end
#
#   # be rake organization_roles:seed --trace
#   task :seed => :environment do
#
#     organization_role_structs = []
#
#     shared_organization_roles = [
#       'Offline Promotion',
#       'Social Media',
#       'Security',
#       'Tech',
#       'Event Operations',
#       'Food Drives',
#       'Volunteers',
#       'Music',
#       'Merch'
#     ]
#
#     tiger_team_organization_roles = [
#       'Press',
#       'Speakers',
#       'Graphics',
#       'Setup / Teardown',
#       'Audio',
#       'Crowd Counting',
#       'Logistics',
#       'Fund Raising',
#       'Partners',
#       'Chant / March',
#       'Signage'
#     ]
#
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "Offline Promotion",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: Team.offline_promotion,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "Press Team A",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "Press Team B",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#     organization_role_structs <<
#     OpenStruct.new(
#       name: "",
#       user_id: User.scott.id,
#       organization_id: Organization.indiana50501.id
#       team_id: ,
#       job_description: nil
#     )
#
#
#
#
#     add_organization_roles(event_type_structs)
#   end
#
#   def add_organization_roles(event_type_structs)
#     event_type_structs.each do |event_type_struct|
#       puts "Processing event type:\n   #{event_type_struct.name}"
#
#
#
#
#
#
#
#
#       status, event_type = EventType.find_or_create(event_type_struct)
#     end
#   end
#
#
#
#   # be rake user:metrics
#   task :metrics => :environment do
#     klass = "EventType"
#     puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
#   end
#
# end
#
