class TripChecklistSerializer < ActiveModel::Serializer
  attributes :id, :title
  
  has_many :checklist_items
end
