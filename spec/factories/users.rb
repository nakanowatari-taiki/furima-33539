FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    surname               {Faker::Name::last_name}
    name                  {Faker::Name::first_name}
    kana_name             {"ナカノ"}
    kana_surname          {"タロウ"}
    birthday              {"2000-01-01"}
  end
end