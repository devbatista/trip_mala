FactoryBot.define do
  factory :trip_list do
    title { "MyString" }
    destination { "MyString" }
    departure_date { "2025-05-19" }
    return_date { "2025-05-19" }
    user { nil }
  end
end
