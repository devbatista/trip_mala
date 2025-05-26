require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('teste@email.com').for(:email) }
  it { should_not allow_value('email_invalido').for(:email) }

  it 'is valid with valid email and password' do
    user = build(:user)
    expect(user).to(be_valid)
  end

  it 'is invalid without email' do
    user = build(:user, email: nil)
    expect(user).to_not(be_valid)
  end
end
