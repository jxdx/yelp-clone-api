module Serializers
  class Restaurant
    def self.index(restaurants)
      restaurants.map do |restaurant|
        restaurant_without_relationships(restaurant)
      end
    end

    # For faster results /restaurants doesn't return any relationship data
    # such as categories or reviews.
    def self.restaurant_without_relationships(restaurant)
      {
        business_id: restaurant.business_id,
        name: restaurant.name,
        address: restaurant.address,
        city: restaurant.city,
        state: restaurant.state,
        country: restaurant.country,
        postal_code: restaurant.postal_code,
        latitude: restaurant.latitude,
        longitude: restaurant.longitude,
        stars: restaurant.stars,
        review_count: restaurant.review_count,
        is_open: restaurant.is_open,
        attributes: restaurant.restaurant_attributes,
        hours: restaurant.hours
      }
    end

    # The show method returns all restaurant, category, and review information
    # it has more details but may be slower
    def self.show(restaurant)
      {
        business_id: restaurant.business_id,
        name: restaurant.name,
        address: restaurant.address,
        city: restaurant.city,
        state: restaurant.state,
        country: restaurant.country,
        postal_code: restaurant.postal_code,
        latitude: restaurant.latitude,
        longitude: restaurant.longitude,
        stars: restaurant.stars,
        review_count: restaurant.review_count,
        is_open: restaurant.is_open,
        attributes: restaurant.restaurant_attributes,
        hours: restaurant.hours,
        categories: restaurant.categories.pluck(:name),
        reviews: restaurant_reviews(restaurant)
      }
    end

    def self.restaurant_reviews(restaurant)
      restaurant.reviews.map do |review|
        {
          business_id: review.business_id,
          review_id: review.review_id,
          user_id: review.user_id,
          stars: review.stars,
          useful: review.useful,
          funny: review.funny,
          cool: review.cool,
          text: review.text,
          date: review.date
        }
      end
    end
  end
end
