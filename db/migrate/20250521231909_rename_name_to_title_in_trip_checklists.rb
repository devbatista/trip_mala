class RenameNameToTitleInTripChecklists < ActiveRecord::Migration[7.1]
  def change
    rename_column :trip_checklists, :name, :titulo
  end
end
