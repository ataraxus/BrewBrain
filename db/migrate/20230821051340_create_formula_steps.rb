class CreateFormulaSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :formula_steps do |t|
      t.string :name
      t.text :description
      t.references :formula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
