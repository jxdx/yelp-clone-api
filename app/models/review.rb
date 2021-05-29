class Review < ApplicationRecord
  # use business_id rather than id
  belongs_to :restaurant, foreign_key: :business_id, primary_key: :business_id
  belongs_to :user, foreign_key: :user_id, primary_key: :user_id

  # Validations
  validates_presence_of :review_id, :business_id, :user_id
end
