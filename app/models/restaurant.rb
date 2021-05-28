class Restaurant < ApplicationRecord
  # Relationships
  has_many :restaurant_categories, dependent: :destroy
  has_many :categories, through: :restaurant_categories

  # Validations
  validates_presence_of :business_id, :name
end
