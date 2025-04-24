# Scaffold Commands

rails g scaffold Organization name:string city:string state:string location:string organization_type:string

rails g scaffold Group name:string organization:references active:boolean

rails g scaffold VettingQuestion body:text organization:references user:references group:references active:boolean

rails g scaffold VettingTranscript name:string  organization:references user:references group:references chat_type:string chat_user:string active:boolean body:text extracted_objects:jsonb 

rails g scaffold Project  name:string city:string state:string location:string organization_type:string

rails g scaffold Project name:string organization:references user:references group:references project_type:string active:boolean body:text 


bin/rails g scaffold Flier title:string organization:references user:references group:references project:references 