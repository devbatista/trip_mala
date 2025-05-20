class TripChecklistSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  has_many :checklist_items
end
