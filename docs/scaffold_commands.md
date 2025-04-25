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
bin/rails g scaffold Contact organization:references user:references is_me:boolean birthday:date birth_date:string birth_year:string email_primary:string email_secondary:string phone_mobile:string phone_secondary:string 