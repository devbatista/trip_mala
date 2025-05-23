class CreateSharedLists < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_lists do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :email
      t.string :token
      t.timestamps
    end
  end
end