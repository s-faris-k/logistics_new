class CreateDrivers < ActiveRecord::Migration[7.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :contact
      t.boolean :status

      t.timestamps
    end
  end
end
