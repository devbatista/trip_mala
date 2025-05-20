class ChecklistItem < ApplicationRecord
  belongs_to :trip_checklist
  belongs_to :categories, optional: true

  validates :name, presence: true
  validates :checked, inclusion: {in: [true, false]}
end
