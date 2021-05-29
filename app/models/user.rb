class User < ApplicationRecord
  # use business_id rather than id
  has_many :reviews, foreign_key: :user_id, primary_key: :user_id

  # encrypt password
  has_secure_password

  # Validations
  validates_presence_of :name, :email, :password_digest
end
