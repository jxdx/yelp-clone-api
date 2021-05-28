# frozen_string_literal: true

# Run with the following command: rake reviews:add_review
namespace :reviews do
  desc 'One time task that that adds restaurants'
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
