# frozen_string_literal: true

class StockItemListener
  def inventory_update(data)
    store = Store.find_by(name: data['store'])
    product = Product.find_by(name: data['model'])

    ActiveRecord::Base.transaction do
      StockItem.lock('FOR NO KEY UPDATE')
               .where(store: store, product: product)
               .select(' ')

      stock_item = StockItem.find_or_initialize_by(store: store, product: product)
      stock_item.count_on_hand = data['inventory']

      stock_item.save!
    end
  end
end
