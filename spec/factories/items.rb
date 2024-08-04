FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    info { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_free_status_id { 2 }
    prefecture_id { 2 }
    schedule_delivery_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
