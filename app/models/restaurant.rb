class Restaurant < ApplicationRecord
  # Relationships
  has_many :restaurant_categories, dependent: :destroy
  has_many :categories, through: :restaurant_categories
  # has_many :reviews, foreign_key: :business_id

  def reviews
    Review.where(business_id: business_id)
  end

  # Validations
  validates_presence_of :business_id, :name
end
