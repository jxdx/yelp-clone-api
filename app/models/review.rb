class Review < ApplicationRecord
  # Validations
  validates_presence_of :review_id, :business_id, :user_id
end
