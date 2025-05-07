namespace :utility do
  #
  #
  #
  # be rake utility:generate_table_partials --trace
  task :generate_table_partials => :environment do
    #
    # The INDEX view or COLLECTION view that this application generates is fundamentally shitty
    # This rake task takes a command line list of object attributes and creates a tabular view
    # instead of the index view of "object", "object", "object" that Rails generates
    #
    # It is important to understand that all this task does is operate on STRING literals; 
    # garbage in, garbage out.  NO ATTEMPT TO SANITY CHECK THE DATA IS USED
    # This is just a string writer to make the process of taking index views from an HOUR+ of 
    # html work to less than 10 seconds
    #
    # Example Invocation Syntax:
    # 
    # be rake utility:generate_table_partials --trace team id|id,name|name,created_by|.user.full_name|=show_active(team.status)|=chat_url(team.chat_url)
    # 
    # This in turn would do the following actions
    # git rename index.html.erb index.html.erb.bak
    # touch index.html
    # touch _teams.html.erb
    # touch _teams_footer.html.erb
    # touch _teams_header.html.erb
    #
    # 
    filenames = ["_vetting_questions_header.html.erb", "_vetting_questions_header.html.erb", "_vetting_questions_footer.html.erb"]
    filenames = ["_organizations_header.html.erb", "_organizations_footer.html.erb", "_organizations.html.erb"]
    
    
    filenames.each do |filename|
      #cmd = "touch #{location}/#{filename}"
      location = File.join(Rails.root, 'app/views/organizations', filename)
      `touch #{location}`
    end    
  end
end