class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.references :client, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.string :starting
      t.string :end
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
