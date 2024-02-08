FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end

  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.between(from: 170, to: 215) }
    brew_time { Faker::Number.between(from: 60, to: 600) }
  end

  factory :subscription do
    association :customer
    association :tea
    title { Faker::Tea.variety }
    price { Faker::Number.between(from: 500, to: 5000) }
    status { ['Active', 'Cancelled'].sample }
    frequency { Faker::Number.between(from: 1, to: 30) }
  end
end
