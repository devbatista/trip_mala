FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-05-19 18:20:20" }
  end
end
