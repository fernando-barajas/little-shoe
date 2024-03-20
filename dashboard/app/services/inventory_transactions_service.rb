# frozen_string_literal: true

class InventoryTransactionsService
  def initialize(store_name:, product_name:)
    @store_name = store_name
    @product_name = product_name
  end

  def process
    InventoryTransaction.create(
      store: store,
      product: product,
      quantity: 1
    )
  end

  private

  attr_reader :store_name, :product_name

  def store
    @store ||= Store.find_by(name: store_name)
  end

  def product
    @product ||= Product.find_by(name: product_name)
  end
end
