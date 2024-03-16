# frozen_string_literal: true

class InventoryManagerService
  class << self
    def call
      OutOfStockNotifier.new.nottify
      InventoryLowNotifier.new.nottify
      OverInventoryNotifier.new.nottify
    end
  end
end