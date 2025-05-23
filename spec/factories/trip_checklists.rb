FactoryBot.define do
  factory :trip_checklist do
    title { "MyString" }
    association :user
    association :trip
  end
end
