FactoryBot.define do
  factory :purchase do
    postal_code { '123-4567' }
    delivery_area_id { 3 }
    municipality { '横浜' }
    address { '青山1-1-1' }
    bulid { '柳ビル１０３' }
    phone_number { '09012345678' }
    token { "pk_test_a05c627a16decf2ecfee6cef" }
    user_id {'hoge'}
    item_id {'hoge'}
  end
end
