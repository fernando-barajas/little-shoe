# frozen_string_literal: true

class InventoryTransactionsListener
  def inventory_update(data)
    inventory_transaction_service = InventoryTransactionsService.new(store_name: data['store'],
                                                                     product_name: data['model'])
    inventory_transaction_service.process
  end
end
