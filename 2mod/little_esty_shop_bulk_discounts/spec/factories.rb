FactoryBot.define do
  factory :customer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Dessert.variety}
  end

  factory :invoice do
    status {[0,1,2].sample}
  end

  factory :merchant do
    name {Faker::Space.galaxy}
  end

  factory :item do
    name {Faker::Coffee.variety}
    description {Faker::Hipster.sentence}
    unit_price {Faker::Number.decimal(l_digits: 2)}
  end

  factory :transaction do
    result {[0,1].sample}
    credit_card_number {Faker::Finance.credit_card}
  end

  factory :invoice_item do
    status {[0,1,2].sample}
  end

  factory :discount do
    quantity {Faker::Number.within(range: 1..1000)}
    percentage {Faker::Number.within(range: 1..100)}
  end
end
