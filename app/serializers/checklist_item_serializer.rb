class ChecklistItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :checked
  belongs_to :category
end
