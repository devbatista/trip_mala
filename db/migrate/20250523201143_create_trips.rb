class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.date :departure_date
      t.date :return_date
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
