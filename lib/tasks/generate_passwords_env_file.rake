namespace :generate_passwords_env_file do
  # be rake generate_passwords_env_file:init --trace
  task :init => :environment do
    usernames_to_passwords = {}
    User.all.each do |user|
      password_command = 'cat /dev/urandom | base64 | head -c 16'
      password = exec(password_command)
      usernames[user.username] = password
    end
    #json_string = usernames_to_passwords.to_json
    file_destination = File.join(Rails.root, 'lib/tasks/data/usernames_to_passwords.json')
    File.write(file_destination, JSON.pretty_generate(usernames))
  end
end