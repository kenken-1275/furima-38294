FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 3) }
    email { Faker::Internet.free_email }
    password { '7a' + Faker::Internet.password(min_length: 6, mix_case: false) }
    password_confirmation { password }
    chinese_last_name { '山田' }
    chinese_first_name { '太郎' }
    japanese_last_name { 'ヤマダ' }
    japanese_first_name { 'タロウ' }
    date_of_birth { Faker::Date.birthday }
  end
end
