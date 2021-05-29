FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
    user_id { Faker::Alphanumeric.alpha(number: 20) }
  end
end
