class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :state
      t.text :description
      t.string :lot_number
      t.decimal :amount_in_kg, precision: 7, scale: 3
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
