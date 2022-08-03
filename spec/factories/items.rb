FactoryBot.define do
  factory :item do
    item_name {Faker::Name.name}
    explanation {Faker::Lorem.sentence}
    price {Faker::Number.number(digits:4)}
    category_id {Faker::Number.between(from:2,to:11)}
    condition_id {Faker::Number.between(from:2,to:7)}
    postage_id {Faker::Number.between(from:2,to:3)}
    area_id {Faker::Number.between(from:2,to:48)}
    arrival_time_id {Faker::Number.between(from:2,to:4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end