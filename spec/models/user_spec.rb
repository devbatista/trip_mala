require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('teste@email.com').for(:email) }
  it { should_not allow_value('email_invalido').for(:email) }

  it { should validate_presence_of(:password).on(:create) }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }

  it { should have_many(:trip_checklists).dependent(:destroy) }
  it { should have_many(:trips).dependent(:destroy) }

  it 'is valid with valid email and password' do
    user = build(:user)
    expect(user).to(be_valid)
  end

  it 'is invalid without email' do
    user = build(:user, email: nil)
    expect(user).to_not(be_valid)
  end

  it 'is invalid with short passowrd' do
    user = build(:user, password: '123')
    expect(user).to_not(be_valid)
  end

  it 'is invalid with duplicate email (case insensitive)' do
    create(:user, email: 'teste@teste.com')
    user = build(:user, email: 'TESTE@teste.com')
    expect(user).to_not(be_valid)
  end
end
