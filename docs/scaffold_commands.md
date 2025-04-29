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


bin/rails g scaffold EventType name:string organization:references user:references

bin/rails g Partners name:string body:string primary_contact:string

bin/rails g scaffold Event name:string event_type:references share_code:references organization:references user:references has_speakers:boolean has_musicians:boolean has_props:boolean has_partners:boolean has_secondary_event:boolean secondary_event_id:integer time_start:time time_end:time date_start:date date_end:date location:string body:text 

bin/rails g scaffold OrganizationRule name:string body:text status:string active:boolean 

bin/rails g Speaker name:string bio:text url:string pronouns:string speaking_count:integer notes:text organization:references user:references

bin/rails g scaffold EventSlotType name:string default_duration:integer default_duration_units:string

bin/rails g scaffold EventSlot event:references event_slot_type:references duration:integer duration_units:string 

bin/rails g scaffold Team name:string organization:references user:references active:boolean

bin/rails g scaffold Rules name:string  organization:references user:references team:references active:boolean body:text notes:text



bin/rails g scaffold PoliticalAction name:string active:boolean organization:references user:references details:text 

bin/rails g scaffold TeamUser team:references user:references active:boolean leader:boolean notes:string


bin/rails g scaffold Contact first_name:string last_name:string full_name:string organization:references user:references is_me:boolean birthday:date birth_date:string birth_year:integer email_primary:string email_secondary:string phone_mobile:string phone_secondary:string signal_username:string discord_username:string discord_server:string url:string favorite_movie:string favorite_color:string favorite_coffee:string favorite_cocktail:string vip:boolean politician:boolean donor:boolean needs_attention:boolean