FactoryBot.define do
  factory :market do
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
        vendor_count { 5 }
      end

      after(:create) do |market, evaluator|
        create_list(:market_vendor, evaluator.vendor_count, market: market)
      end
    end
  end

  factory :vendor do
    name { Faker::Commerce.vendor }
    description { "This vendor sells #{Faker::Commerce.product_name} made from #{Faker::Commerce.material} for the #{Faker::Company.industry} industry" }
    contact_name { Faker::Name.name }
    contact_phone { Faker::PhoneNumber.phone_number }
    credit_accepted { Faker::Boolean.boolean }
  end

  factory :market_vendor do
    association :market, factory: :market, strategy: :create
    association :vendor, factory: :vendor, strategy: :create
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
