class RenameTripListsIdToTripListIdInTripChecklists < ActiveRecord::Migration[7.1]
  def change
    rename_column :trip_checklists, :trip_lists_id, :trip_list_id
  end
end
