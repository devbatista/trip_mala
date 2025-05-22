class TripListSerializer < ActiveModel::Serializer
  attributes :id, :title, :destination, :departure_date, :return_date
end
