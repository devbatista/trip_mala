class Trip < ApplicationRecord
  belongs_to :user

  has_many :trip_checklists, dependent: :destroy

  validates :title, :destination, :departure_date, :return_date, presence: true
  validate :return_after_departure

  private
  
    def return_after_departure
      if return_date && departure_date && return_date < departure_date
        errors.add(:return_date, "must be after the departure date")
      end
    end
end
