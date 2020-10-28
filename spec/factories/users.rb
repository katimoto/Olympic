FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6)}
    category_id           { rand(2..20) }
    career                { Faker::Lorem.sentence }
    introduce             { Faker::Lorem.sentence }
  end
end
