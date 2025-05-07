# Understanding the Polly Data Model

Listed below are the migrations -- in creation order -- of the different data tables / table changes:

```sql
20240421104820_create_organizations.rb
20250222140200_devise_create_users.rb
20250228044933_add_user_field_indexes.rb
20250422083347_create_groups.rb
20250422083357_create_vetting_questions.rb
20250422083405_create_vetting_transcripts.rb
20250423152122_create_projects.rb
20250423205602_add_status_to_project.rb
20250424012501_acts_as_votable_migration.rb
20250424141217_create_active_storage_tables.active_storage.rb
20250424141511_create_fliers.rb
20250424175736_change_title_to_name_on_fliers.rb
20250424175917_add_due_date_to_fliers.rb
20250424180035_add_flier_type_to_fliers.rb
20250426164147_create_event_types.rb
20250426192926_create_speakers.rb
20250426193927_create_event_slot_types.rb
20250427040012_create_teams.rb
20250427040636_create_rules.rb
20250427114138_create_contact_cards.rb
20250427134651_create_team_users.rb
20250428091608_add_signal_link_to_teams.rb
20250428122013_add_pronouns_to_contact_cards.rb
20250428232359_create_political_actions.rb

```
Here are the core tables that make up the application:

* organization -- every user belongs to an organization such as 50501 or westside democrats or indivisible
* user -- this represents the login account of a user
* groups -- a way to group objects; currently not terribly used; may go away; tbd
* vetting_questions -- a set of questions to be asked of someone who wants to join signal or the organization or whatever; different users can have their own sets of vetting questions
* vetting_transcripts -- the chat log of the person being vetting saved for full text indexing and data extraction for objects such as phone numbers or email addresses
* projects -- a high level effort that spans one or more people over a given period of time with a due date
* votable -- a polymorphic table which allows ANY object to be voted on provided that the votable plugin is mixed into the core model (example -- projects can be voted on AS can be fliers)
* event_types -- a data table for tracking possible different types of events such as a PROTEST versus a COFFEE HOUR versus a SIT IN
* speakers -- a pool of speakers that could be called upon to serve in an event
* teams -- a named collection of user resources that can dynamically organize to accomplish something
* rules -- in a democracy there HAVE TO BE RULES or you have ANARCHY.  For example the 50501 organization has ONLY 1 rule -- non violence.  But a team might have OTHER rules such "DON'T DISCRIMINATE" or "DON'T BE LATE FOR A MEETING" (and maybe 50501 has more than than one rule).  It is my belief (and the I'm the one writing the software that we need more democracy NOT less and we need to understand the rules that govern us)
* contact_cards -- this is a [Farley File](https://en.wikipedia.org/wiki/Farley_file) based contact record that allow contact records to be SHARED between individuals.  
* team_users -- this is mapping table between the named team and the users that make it up.  To track who is a leader on a given team, there is a boolean attribute THUS there can be more than one leader per team AND IT DELIBERATELY DOESN'T TRACK WHO THE LEAD LEADER IS
* political_actions -- this model tracks different types of political actions that we want to come out of some project or event.  This model was suggested by Belladonna and still needs some additional thinking for how we interface with an external service (there is a JSON field attached to support the extensibility)

So what can that underlying data model do TODAY?

* A user can join an organization
* They can understand the organization's rules before they join it
* They can join a team to work on a project and understand the rules of the team before they join it
* They can contribute contact_cards to share contact info across the organization
* They can vote on a flier so an artist can see if their work was good
* They can vote on a project to leadership can prioritize resources

## Security Model

Lucy who is considering contributing code brought up the sensitive nature of contact cards and asked about the per item security model.  My response is if that matters to you then join the project and contribute it.  I don't disagree with the conceptual need but I think it is being driven by paranoia not reality.

Here