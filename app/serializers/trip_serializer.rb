class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :destination, :departure_date, :return_date
  has_many :checklists, serializer: TripChecklistSerializer

  def checklists
    object.trip_checklists
  end
end
