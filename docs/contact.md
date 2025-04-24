indiana50501.org/docs on 📙 main [📝🤷‍🏎💨] via 💎 v3.2.0 on ☁️  (us-west-2)
❯ head -n2 /Users/sjohnson/Downloads/organization_contacts.csv
Organization,50501 Contact,Contact Info for Org,Used Previously?
Elders Groups ,Oz,,

indiana50501.org/docs on 📙 main [📝🤷‍🏎💨] via 💎 v3.2.0 on ☁️  (us-west-2)
❯ head -n2 /Users/sjohnson/Downloads/media_contacts.csv
Organization,Email Contact,Email,Phone Contact,Email,4/5 Notice?
WISH TV,General,newsdesk@WISHTV.com,,(317) 923-8888,

Importer that:

1. Lets you select a CSV
2. Lets you map the fields 
3. Lets you import from a phone contact record

rails g scaffold Contact belongs_to:organization belongs_to:group belongs_to:user first_name:string last_name:string email:string phone1:string phone2:string organization:string organization_type:string, email_contact:string, phone_contact:string, home_page:string, notes:text

name:string  organization:references user:references group:references chat_type:string chat_user:string active:boolean body:text extracted_objects:jsonb 