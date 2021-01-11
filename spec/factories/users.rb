FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name{"小林"}
    first_name{"惣市"}
    family_name_kana{"コバヤシ"}
    first_name_kana{"ソウイチ"}
    birth_day{"1992-07-20"}
  end
end