class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.date :date
      t.references :vehicle, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :start_km
      t.string :end_km
      t.string :start_loc
      t.string :end_loc

      t.timestamps
    end
  end
end
