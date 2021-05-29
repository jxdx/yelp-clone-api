FactoryBot.define do
  factory :review do
    review_id { Faker::Alphanumeric.alpha(number: 20) }
    text { 'This is a review' }
  end
end
