class CreateFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :formulas do |t|
      t.string :name
      t.text :description
      t.integer :state
      t.references :formula_category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
