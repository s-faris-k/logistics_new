class CreateExpenditures < ActiveRecord::Migration[7.2]
  def change
    create_table :expenditures do |t|
      t.string :title
      t.decimal :amount
      t.string :category
      t.references :vehicle, null: false, foreign_key: true
      t.references :expenditurable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
