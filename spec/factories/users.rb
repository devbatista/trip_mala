FactoryBot.define do
  factory :user do
    email { "user#{rand(1000)}@example.com"}
    password { "123456" }
  end
end
