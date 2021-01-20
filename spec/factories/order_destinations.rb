FactoryBot.define do
  factory :order_destination do
    post_code { '965-0837' }
    prefecture_id { 2 }
    city { '会津若松市' }
    address { '大町2-3' }
    building_name { 'サンハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
