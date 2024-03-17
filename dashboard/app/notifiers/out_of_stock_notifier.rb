# frozen_string_literal: true

class OutOfStockNotifier < BaseNotifier
  def notify
    out_of_stock_alerts = build_alert_messages
    return if out_of_stock_alerts.blank?

    broadcast_alert(out_of_stock_alerts, OUT_OF_STOCK_ALERT_TARGET)
  end

  private

  ALERT_TYPE = 'danger'

  def build_alert_messages
    alert_messages = []

    StockItem.out_of_stock.each do |stock_item|
      count_on_hand = stock_item.count_on_hand

      next if count_on_hand.between?(10, 70)

      alert_messages << build_alert_message(stock_item, count_on_hand)
    end

    alert_messages
  end

  def build_alert_message(stock_item, count_on_hand)
    transfer_from_store = store_name_with_enough_inventory(stock_item)
    alert_presenter(
      stock_item: stock_item,
      transfer_from_store: transfer_from_store,
      count_on_hand: count_on_hand,
      alert_type: ALERT_TYPE
    ).message
  end
end