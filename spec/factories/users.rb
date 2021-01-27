FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"hoge12"}
    password_confirmation {"hoge12"}
    surname               {"中野"}
    name                  {"太郎"}
    kana_name             {"ナカノ"}
    kana_surname          {"タロウ"}
    birthday              {"2000-01-01"}
  end
end