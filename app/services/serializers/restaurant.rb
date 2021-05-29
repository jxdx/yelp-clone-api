module Serializers
  class Restaurant
    def self.index(restaurants, include_reviews = false)
      restaurants.map do |restaurant|
        show(restaurant, include_reviews)
      end
    end

    def self.show(restaurant, include_reviews)
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
        reviews: restaurant_reviews(restaurant, include_reviews)
      }
    end

    def self.restaurant_reviews(restaurant, include_reviews)
      return 'request restaurant details for reviews' if include_reviews == false

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
