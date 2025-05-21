class TripChecklist < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :title, presence: true
end
