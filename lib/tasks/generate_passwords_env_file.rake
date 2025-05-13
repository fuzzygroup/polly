namespace :generate_passwords_env_file do
  # be rake generate_passwords_env_file:init --trace
  task :init => :environment do
    usernames_to_passwords = {}
    #debugger
    User.all.each do |user|
      puts "Processing user: #{user.id} -- #{user.username}"
      password_command = 'cat /dev/urandom | base64 | head -c 8'
      password = `#{password_command}`
      puts "After password command"
      usernames_to_passwords[user.username] = password
    end
    #debugger
    #json_string = usernames_to_passwords.to_json
    file_destination = File.join(Rails.root, 'lib/tasks/data/usernames_to_passwords.json')
    
    result = File.write(file_destination, JSON.pretty_generate(usernames_to_passwords))
  end
end