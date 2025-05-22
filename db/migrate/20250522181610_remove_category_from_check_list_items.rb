class RemoveCategoryFromCheckListItems < ActiveRecord::Migration[7.1]
  def change
    remove_reference :checklist_items, :category, foreign_key: true
  end
end
