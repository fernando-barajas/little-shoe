# frozen_string_literal: true

Rails.application.reloader.to_prepare do
  Wisper.subscribe(StockItemListener.new)
  Wisper.subscribe(InventoryTransactionsListener.new)
  Wisper.subscribe(InventoryManagerListener.new)
end