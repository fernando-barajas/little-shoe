class CreateInventoryTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_transactions do |t|
      t.references :store, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
