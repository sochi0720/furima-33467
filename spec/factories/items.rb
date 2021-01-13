FactoryBot.define do
  factory :item do
    name              { 'item' }
    price             { 300 }
    description       { 'aaa' }
    item_state_id     { 2 }
    shipping_day_id   { 2 }
    shipping_cost_id  { 2 }
    prefecture_id     { 2 }
    category_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
