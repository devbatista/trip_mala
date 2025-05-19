class TripChecklist < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, dependent: :destroy

  validates :name, presence: true
end
