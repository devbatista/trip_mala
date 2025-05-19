FactoryBot.define do
  factory :checklist_item do
    name { "MyString" }
    checked { false }
    trip_checklist { nil }
  end
end
