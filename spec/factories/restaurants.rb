FactoryBot.define do
  factory :restaurant do
    name { Faker::Name.name }
    business_id { Faker::Alphanumeric.alpha(number: 20) }
  end
end
