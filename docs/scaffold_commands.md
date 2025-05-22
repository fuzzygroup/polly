# Scaffold Commands

rails g scaffold Organization name:string city:string state:string location:string organization_type:string



rails g scaffold Group name:string organization:references active:boolean



rails g scaffold VettingQuestion body:text organization:references user:references group:references active:boolean

rails g scaffold VettingTranscript name:string  organization:references user:references group:references chat_type:string chat_user:string active:boolean body:text extracted_objects:jsonb 



rails g scaffold Project  name:string city:string state:string location:string organization_type:string

rails g scaffold Project name:string organization:references user:references group:references project_type:string active:boolean body:text 



bin/rails g scaffold Flier name:string organization:references user:references group:references project:references 



bin/rails g scaffold Team name:string organization:references group:references team_type:string

bin/rails g scaffold TeamMember team:references user:references



bin/rails g Partners name:string body:string primary_contact:string

bin/rails g scaffold ShareCode share_code:string user:references organization:references event:references

bin/rails g scaffold Event name:string event_type:references date_start:date date_end:date time_start:time time_end:time location:string share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean body:text 

has_secondary_event:boolean secondary_event_id:integer

bin/rails g scaffold EventType name:string organization:references user:references

bin/rails g scaffold EventSlotType name:string default_duration:integer default_duration_units:string

bin/rails g scaffold EventVolunteer first_name:string last_name:string pronouns:string phone_number:string email:string event:references user:references how_do_you_want_to_help:text



bin/rails g scaffold Speaker name:string bio:text url:string pronouns:string speaking_count:integer notes:text organization_name:string user:references contact_card:references url:string

bin/rails g scaffold Musician name:string band_name:string bio:text url:string pronouns:string play_count:integer notes:text user:references contact_card:references 

bin/rails g scaffold EventSlot name:string event:references event_slot_type:references speaker:references duration:integer computed_start_at:time body:text

bin/rails g scaffold Poll name:string share_code:references user:references organization:references body:text
bin/rails g scaffold PollOption name:string poll:references widget_type:string value:string body:text 
bin/rails g scaffold PollResponse poll:references value:string

bin/rails g scaffold Confirmation event:references name
 

bin/rails g scaffold OrganizationRule name:string body:text status:string active:boolean 

bin/rails g scaffold BankDeposit name:string date_collected:date amount:decimal event:references user:references organization:references notes:text

bin/rails g scaffold EventSlot event:references event_slot_type:references duration:integer duration_units:string 

bin/rails g scaffold Team name:string organization:references user:references active:boolean

bin/rails g scaffold Rules name:string  organization:references user:references team:references active:boolean body:text notes:text



bin/rails g scaffold PoliticalAction name:string active:boolean organization:references user:references details:text 

bin/rails g scaffold TeamUser team:references user:references active:boolean leader:boolean notes:string


bin/rails g scaffold Contact first_name:string last_name:string full_name:string organization:references user:references is_me:boolean birthday:date birth_date:string birth_year:integer email_primary:string email_secondary:string phone_mobile:string phone_secondary:string signal_username:string discord_username:string discord_server:string url:string favorite_movie:string favorite_color:string favorite_coffee:string favorite_cocktail:string vip:boolean politician:boolean donor:boolean needs_attention:boolean

bin/rails g scaffold TeamUserRule team:references user:references rule:references

bin/rails g scaffold OrganizationUserRule organization:references user:references rule:references

bin/rails g scaffold TeamRule team:references rule:references active:boolean

bin/rails g scaffold OrganizationRule organization:references rule:references active:boolean

bin/rails g scaffold CheckList name:string
bin/rails g scaffold CheckListItem name:string status:boolean

Also - giving you dates in summer that I’m out of town - May 15-18; June 6-10; August 3-10. Also, Sunil is having surgery on his knee July 2. I anticipate a huge protest around the 4th. I will make sure I can speak, but then I’ll likely have to bounce and take care of him. He tore his meniscus.


bin/rails g scaffold Availability user:references date_start:date date_end:date availability:boolean

bin/rails g scaffold Links organization:references team:references user:references name:string url:string

bin/rails g scaffold EventShift name:string duration:integer time_start:time time_end:time people_needed:integer
bin/rails g scaffold EventProp name:string

bin/rails g scaffold EventAttendance event:references organization:references user:references status:boolean name:string ip_address:string user_agent:string

rails generate scaffold Confirmation confirmable:references{polymorphic} event_slot:references confirmed:boolean

rails generate scaffold OfflinePromotionLocations name:string contact_card:references

rails g scaffold EventTasks name:string event:references user:references team:references done:boolean body:text notes:text

Name 
Body
Status
User-id
Assigned to id
Project id
Team id

rails g scaffold MeetingNote name:string participants:string location:string meeting_date:date body:text 

rails g scaffold OrganizationRole name:string user:references team:references job_description:text status:string

rails g scaffold Speech name:string tags:string speaker:references user:references event:references body:text 
