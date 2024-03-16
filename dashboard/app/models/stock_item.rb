class StockItem < ApplicationRecord
  belongs_to :store
  belongs_to :product

  after_commit :update_inventory_message

  scope :by_product_id, ->(product_id) { where(product_id: product_id).order(count_on_hand: :desc) }
  scope :out_of_stock, ->{ where(count_on_hand: 0) }
  scope :inventory_low, ->{ where(count_on_hand: [1..10]) }
  scope :over_inventory, ->{ where(count_on_hand: 99...Float::INFINITY) }

  def self.stock_item_with_enough_inventory(product_id)
    stock_item = by_product_id(product_id).first

    return if stock_item.count_on_hand < 50

    stock_item
  end

  private

  def update_inventory_message
    broadcast_replace_to(
      store,
      target: "inventory_store_#{store.id}",
      partial: '/stores/inventory',
      locals: { store: store, store_stock_items: store.stock_items.order(count_on_hand: :asc) }
    )
  end
end