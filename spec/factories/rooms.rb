FactoryBot.define do
  factory :room do
    name              {Faker::Team.name}
    price             { rand(300..9999999) }
    category_id       { rand(2..20) }
    text              { Faker::Lorem.sentence }
    association :user
  end
end
