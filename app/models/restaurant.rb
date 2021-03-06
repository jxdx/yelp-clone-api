class Restaurant < ApplicationRecord
  # Relationships
  has_many :restaurant_categories, dependent: :destroy
  has_many :categories, through: :restaurant_categories
  # use business_id rather than id
  has_many :reviews, foreign_key: :business_id, primary_key: :business_id

  # Validations
  validates_presence_of :business_id, :name

  def self.search(search_terms)
    Restaurant
      .joins(:reviews)
      .includes(:reviews)
      .where('reviews.text ILIKE ?', "%#{search_terms.downcase}%")
  end
end
