class AddCategoryToTripChecklists < ActiveRecord::Migration[7.1]
  def change
    add_reference :trip_checklists, :category, foreign_key: true
  end
end
