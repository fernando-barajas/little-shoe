# frozen_string_literal: true

class InventoryManagerService
  class << self
    def call
      OutOfStockNotifier.new.notify
      LowInventoryNotifier.new.notify
      OverstockNotifier.new.notify
    end
  end
end
