class ChecklistItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :checked
end
