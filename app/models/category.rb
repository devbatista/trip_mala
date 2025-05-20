class Category < ApplicationRecord
  belongs_to :trip_checklist
  has_many :checklist_items, dependent: :destroy

  validates :name, presence: true
end
