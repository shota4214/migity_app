FactoryBot.define do
  factory :expert_detail do
    office_name { "MyString" }
    license { "MyString" }
    speciality { "MyString" }
    introduction { "MyText" }
    other_license { "MyString" }
    user { nil }
  end
end
