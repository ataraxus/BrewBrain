class CreateFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :formulas do |t|
      t.string :name
      t.text :description
      t.integer :state

      t.timestamps
    end
  end
end
