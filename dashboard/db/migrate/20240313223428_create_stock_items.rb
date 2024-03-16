class CreateStockItems < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_items do |t|
      t.references :store, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.integer :count_on_hand

      t.timestamps
    end

    add_index :stock_items, [:store_id, :product_id], unique: true
  end
end
