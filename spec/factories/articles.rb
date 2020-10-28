FactoryBot.define do
  factory :article do
    title             { Faker::Lorem.sentence }
    text              { Faker::Lorem.sentence }
    association :user
  end
end
