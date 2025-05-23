class CreateTripChecklists < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_checklists do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
    
    add_index :trip_checklists, :category_id
    add_index :trip_checklists, :trip_id
    add_index :trip_checklists, :user_id
  end
end
