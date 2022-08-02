FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number:3)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length:6, mix_case:false)}
    password_confirmation {password}
    chinese_last_name {Faker::Name.last_name}
    chinese_first_name {Faker::Name.first_name}
    japanese_last_name {Faker::Name.last_name}
    japanese_first_name {Faker::Name.first_name}
    date_of_birth {Faker::Date.birthday}
  end
end