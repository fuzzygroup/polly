# namespace :events_flesh_out do
#
#   #bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text
#
#
#   # be rake events:init --trace
#   task :init => :environment do
#     Rake::Task["events_flesh_out:seed"].invoke
#     Rake::Task["events:metrics"].invoke
#   end
#
#   # be rake events:flesh_out_614_fort_wayne
#   task :flesh_out_614_fort_wayne => :environment do
#     event = Event.where(name: "6/14 - Fort Wayne - No Kings Day").first
#
#     event.add_speaker("Kyle Quandt Opening Address - The Good and the Bad", Speaker.scott_johnson,10)
#     event.add_buffer
#     event.add_speaker("TBD",Speaker.tbd, 10)
#     event.add_buffer
#     event.add_speaker("Indivisible",Speaker.tbd, 10)
#     event.add_buffer
#     event.add_speaker("Fort Wayne Dems",Speaker.tbd, 10)
#     event.add_buffer
#     event.add_speaker("Resisting Oracle on Something or Other", Speaker.resisting_oracle,10)
#     event.add_buffer
#     event.add_speaker("Open Mic -- How Do You Feel / What's Bugging You",Speaker.scott_johnson, 30)
#     event.add_buffer
#     event.add_musician("TBD", Musician.tbd, 15)
#     event.add_buffer
#     event.add_speaker("Max Haddad: Let's Mock the King's Decrees", Speaker.max_haddad, 10)
#     event.add_buffer
#     event.add_speaker("Kyle Quandt Closing Remarks", Speaker.scott_johnson,5)
#     event.add_buffer
#     event.add_march("Closing March - Optional", 0)
#
#     # slots = []
#     # slots << OpenStruct.new(
#     #
#     # )
#     #
#     # "Opening Address by Scott"
#     # slots << "Closing Address by Scott"
#     # slots << "Trump Executive Order Overview by Scott"
#     # slots << "Resisting Oracle on Executive Orders"
#     # slots << "Executive Orders by Destiny Wells"
#
#   end
#
#   # 5/25 start with march -- 1st hour or 45 minutes
#   # 5/25 START WITH def MARCHING
#   # March at the end
#
#
#
#
#
#
#
#   #
#   # POLL SYSTEM
#   #
#
#
#
#
#
#
#   # be rake event:metrics
#   task :metrics => :environment do
#     klass = "Event"
#     puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
#   end
#
# end
#
