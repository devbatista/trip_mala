class AddCategoryToChecklistItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :checklist_items, :category, null: true, foreign_key: true
  end
end
