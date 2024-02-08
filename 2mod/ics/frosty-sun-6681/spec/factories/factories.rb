FactoryBot.define do
  factory :hospital do
    name {Faker::Company.name}
  end

  factory :doctor do
    name {Faker::Name.name}
    specialty {Faker::Company.department}
    university {Faker::University.name}
  end

  factory :doctor_patient do
  end

  factory :patient do
    name {Faker::Name.name}
    age {Faker::Number.number(digits: 2)}

    trait :adult do
      age {Faker::Number.between(from: 18, to: 100)}
    end

    trait :child do
      age {Faker::Number.between(from: 0, to: 17)}
    end
  end
end
