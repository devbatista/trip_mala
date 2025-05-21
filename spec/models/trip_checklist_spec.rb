require 'rails_helper'

RSpec.describe TripChecklist, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:checklist_items).dependent(:destroy) }

  it 'is valid with name and username' do
    checklist = build(:trip_checklist)
    expect(checklist).to(be_valid)
  end

  it 'is invalid without name' do
    checklist = build(:trip_checklist, name: nil)
    expect(checklist).to_not(be_valid)
  end
end
