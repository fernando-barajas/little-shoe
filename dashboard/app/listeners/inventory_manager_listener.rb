# frozen_string_literal: true

class InventoryManagerListener
  def inventory_update(data)
    InventoryManagerService.call
  end
end