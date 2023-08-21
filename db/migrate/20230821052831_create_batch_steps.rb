class CreateBatchSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_steps do |t|
      t.string :name
      t.text :description
      t.references :resource, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
