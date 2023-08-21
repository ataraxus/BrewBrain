class CreateExecutedSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :executed_steps do |t|
      t.string :name
      t.integer :state
      t.timestamp :executed_at
      t.references :user, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.references :process_step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
