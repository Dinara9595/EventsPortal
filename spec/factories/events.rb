FactoryBot.define do
  sequence :title do |n|
    "Event test title#{n}"
  end

  factory :event do
    title
    body { "Event test body" }

    association :admin

    trait :invalid do
      body { nil }
    end
  end
end
