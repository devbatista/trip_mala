class TripChecklist < ApplicationRecord
  belongs_to :user
  belongs_to :trip_list
  belongs_to :category, optional: true

  has_many :checklist_items, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :title, presence: true
end
