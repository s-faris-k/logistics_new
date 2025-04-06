class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :number
      t.boolean :status

      t.timestamps
    end
  end
end
