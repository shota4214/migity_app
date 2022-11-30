FactoryBot.define do
  factory :user do
    name { "first_name" }
    email { "first@test.com" }
    pharmacy { "first薬局" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :second_user, class: User do
    name { "second_name" }
    email { "second@test.com" }
    pharmacy { "second薬局" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :third_user, class: User do
    name { "third_name" }
    email { "third@test.com" }
    pharmacy { "third薬局" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :admin_user, class: User do
    name { "admin_name" }
    email { "admin@test.com" }
    pharmacy { "admin薬局" }
    admin { "true" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :pharmacist_user, class: User do
    name { "pharmacist_name" }
    email { "pharmacist@test.com" }
    pharmacy { "pharmacist薬局" }
    pharmacist { "true" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
