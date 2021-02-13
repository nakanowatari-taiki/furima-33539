FactoryBot.define do
  factory :item do
    product_name          {"商品名"}
    price                 {1111}
    text                  {"hoge"}
    # user_id               {"hoge"}
    state_id              {2}
    categore_id           {2}
    delivery_burden_id    {2}
    delivery_area_id      {2}
    delivery_days_id      {2}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
