class Category < ApplicationRecord
  # Relationships
  has_many :restaurant_categories
  has_many :restaurants, through: :restaurant_categories
  has_many :happy_hours, through: :restaurant_categories

  # Validations
  validates_presence_of :name
end
