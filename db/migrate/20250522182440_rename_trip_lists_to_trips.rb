class RenameTripListsToTrips < ActiveRecord::Migration[7.1]
  def change
    rename_table :trip_lists, :trips

    rename_column :shared_lists, :trip_list_id, :trip_id
    rename_column :trip_checklists, :trip_list_id, :trip_id
    
    add_foreign_key :shared_lists, :trips
    add_foreign_key :trip_checklists, :trips
  end
end
