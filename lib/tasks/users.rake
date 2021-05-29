# frozen_string_literal: true

# Run with the following command: rake users:add_user
namespace :users do
  desc 'One time task that that adds users'
  task add_users: :environment do
    file = File.read('data/users.jsonl')
    users = JSONL.parse(file)
    puts 'starting users import'
    users.each do |user|
      user = User.new(user)
      # Create users without passwords
      user.save(validate: false)

    rescue
      puts "whoops something went wrong with #{user}"
    end

    puts 'completed users import'
  end
end
