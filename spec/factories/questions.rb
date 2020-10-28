FactoryBot.define do
  factory :question do
    text              { Faker::Lorem.sentence }
    title             { Faker::Lorem.sentence }
    category_id       { rand(2..20) }
    association :user
  end
end
