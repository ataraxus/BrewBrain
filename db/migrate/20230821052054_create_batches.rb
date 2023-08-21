class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.text :description
      t.integer :state
      t.boolean :finished
      t.integer :amount

      t.timestamps
    end
  end
end
