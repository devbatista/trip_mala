class CreateChecklistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :checklist_items do |t|
      t.string :name
      t.boolean :checked
      t.references :trip_checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
