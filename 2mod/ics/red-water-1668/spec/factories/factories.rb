FactoryBot.define do
  factory :chef do
    name { Faker::Name.name }
  end

  factory :dish do
    name { Faker::Food.dish }
    description { Faker::Food.description }
  end

  factory :dish_ingredient do

  end

  factory :ingredient do
    name { Faker::Food.ingredient }
    calories { Faker::Number.within(range: 5..300) }
  end
end
