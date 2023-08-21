class CreateFormulaIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :formula_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :percentage, precision: 6, scale: 4
      t.references :formula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
