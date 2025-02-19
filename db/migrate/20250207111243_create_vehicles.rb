class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :number
      t.string :model

      t.timestamps
    end
  end
end
