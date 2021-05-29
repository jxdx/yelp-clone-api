# frozen_string_literal: true

# Run with the following command: rake restaurants:add_restaurant
namespace :restaurants do
  desc 'One time task that that adds restaurants'
  task add_restaurants: :environment do
    file = File.read('data/restaurants.jsonl')
    restaurants = JSONL.parse(file)
    puts 'starting restaurant import'
    restaurants.each do |res|
      new_res = Restaurant.create(
        business_id: res['business_id'],
        name: res['name'],
        address: res['address'],
        city: res['city'],
        state: res['state'],
        postal_code: res['postal_code'],
        country: res['country'],
        latitude: res['latitude'],
        longitude: res['longitude'],
        stars: res['stars'],
        review_count: res['review_count'],
        is_open: res['review_count'],
        restaurant_attributes: res['attributes'],
        hours: res['hours']
      )

      res['categories'].split(', ').each do |cat|
        cat = Category.find_or_create_by(name: cat)
        RestaurantCategory.create(category_id: cat.id, restaurant_id: new_res.id)
      end
    rescue
      puts "whoops something went wrong with #{new_res}"
    end

    puts 'completed restaurant import'
  end
end
