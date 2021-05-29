# frozen_string_literal: true

# You must run rake restaurants:add_restaurants and
# rake users:add_user before running this task

# Run with the following command: rake reviews:add_review
namespace :reviews do
  desc 'One time task that that adds reviews'
  task add_reviews: :environment do
    file = File.read('data/reviews.jsonl')
    reviews = JSONL.parse(file)
    puts 'starting reviews import'
    reviews.each do |review|
      Review.create(review)

      rescue
        puts "whoops something went wrong with #{review}"
    end

    puts 'completed reviews import'
  end
end
