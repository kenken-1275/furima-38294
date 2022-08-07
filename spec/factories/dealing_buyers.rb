FactoryBot.define do
  factory :dealing_buyer do
    post_number {"123-4567"}
    area_id {Faker::Number.between(from: 2, to: 48)}
    city {"横浜市"}
    address {"1-1-1"}
    building_name {"テック建物"}
    tel_number {Faker::Number.number(digits: 10)}
    token {Faker::Lorem.sentence}
  end

end
