FactoryGirl.define do
	factory :fan do
    sequence(:email) { |n| "Smith-#{n}@example.com"}
    password '123123123'

    after(:create) { |fan| fan.confirm }

    trait :with_dishes do
      after(:create) do |fan|
        create_list(:dish, 2, fan: fan)
      end
    end
  end
end
