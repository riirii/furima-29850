FactoryBot.define do
  factory :item do
    name                         { Faker::Name.name }
    explanation                  { Faker::Lorem.sentence }
    category_id                  { rand(1..10) }
    status_id                    { rand(1..6) }
    delivery_fee_id              { rand(1..2) }
    delivery_from_id             { rand(1..47) }
    delivery_day_id              { rand(1..3) }
    price                        { rand(300..9_999_999) }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sakura.jpg'), filename: 'sakura.jpg')
    end
  end
end
