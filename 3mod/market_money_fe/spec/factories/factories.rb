FactoryBot.define do
  factory :market do
    skip_create

    id { Faker::Number.within(range: 300_000..400_000) }
    name { Faker::Company.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    county { Faker::Address.country }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }

    factory :market_with_vendors do
      transient do
        vendors { create_list(:vendor) }
      end
    end

    initialize_with { new(attributes) }
  end

  factory :vendor do
    skip_create

    id { Faker::Number.within(range: 11..10_000) }
    name { Faker::Commerce.vendor }
    description { "This vendor sells #{Faker::Commerce.product_name} made from #{Faker::Commerce.material} for the #{Faker::Company.industry} industry" }
    contact_name { Faker::Name.name }
    contact_phone { Faker::PhoneNumber.phone_number }
    credit_accepted { Faker::Boolean.boolean }

    initialize_with { new(attributes) }
  end

  factory :automatic_teller_machine do
    skip_create

    id { Faker::Number.within(range: 11..10_000) }
    name { Faker::Bank.name }
    address { Faker::Address.full_address }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    distance { Faker::Number.between(from: 11, to: 1_000.0) }

    initialize_with { new(attributes) }
  end
end
