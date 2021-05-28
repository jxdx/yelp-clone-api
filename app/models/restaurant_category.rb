class RestaurantCategory < ApplicationRecord
  # Relationships
  belongs_to :category
  belongs_to :restaurant
end
