FactoryBot.define do
  factory :item do
    description { "MyString" }
    packed { false }
    trip_list { nil }
  end
end
