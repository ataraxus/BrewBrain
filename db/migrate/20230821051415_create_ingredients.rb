class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.integer :type

      t.timestamps
    end
  end
end
