# frozen_string_literal: true

class BaseNotifier
  private

  OUT_OF_STOCK_ALERT_TARGET = 'stock_item_out_of_stock_alerts'
  INVENTORY_LOW_ALERT_TARGET = 'stock_item_low_stock_alerts'
  OVER_INVENROTY_ALERT_TARGET = 'stock_item_over_inventory_alerts'

  def broadcast_alert(alert_messages, broadcast_target)
    Turbo::StreamsChannel.broadcast_update_to(
      'stock_item',
      target: broadcast_target,
      partial: '/stock_items/alert',
      locals: {
        alert_messages: alert_messages
      }
    )
  end

  def alert_presenter(stock_item:, count_on_hand:, alert_type:, transfer_from_store: nil)
    ::AlertPresenter.new(
      store_name: stock_item.store.name,
      product_name: stock_item.product.name,
      count_on_hand: count_on_hand,
      alert_type: alert_type,
      transfer_from_store: transfer_from_store
    )
  end

  def store_name_with_enough_inventory(stock_item)
    stock_item_with_enough_inventory = StockItem.stock_item_with_enough_inventory(stock_item.product_id)

    return '' if stock_item_with_enough_inventory.nil?

    stock_item_with_enough_inventory.store.name
  end
end
