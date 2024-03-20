# frozen_string_literal: true

class InventoryManagerListener
  def inventory_update(_data)
    InventoryManagerService.call
  end
end
