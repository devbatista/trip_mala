require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  it { should belong_to(:trip_checklist) }
  it { should validate_presence_of(:name) }
  it { should validate_inclusion_on(:checked).in_array([true, false]) }

  it "sets verified to false by default" do
    item = ChecklistItem.new
    expect(item.checked).to eq(false)
  end
end
