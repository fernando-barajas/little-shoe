# frozen_string_literal: true

class LowInventoryNotifier < BaseNotifier
  def notify
    inventory_low_alerts = build_alert_messages
    return if inventory_low_alerts.blank?

    broadcast_alert(inventory_low_alerts, INVENTORY_LOW_ALERT_TARGET)
  end

  private

  ALERT_TYPE = 'warning'

  def build_alert_messages
    out_of_stock_alerts = []

    StockItem.inventory_low.each do |stock_item|
      count_on_hand = stock_item.count_on_hand

      next if count_on_hand.between?(10, 70)

      out_of_stock_alerts << build_alert_message(stock_item, count_on_hand)
    end

    out_of_stock_alerts
  end

  def build_alert_message(stock_item, count_on_hand)
    alert_presenter(
      stock_item: stock_item,
      count_on_hand: count_on_hand,
      alert_type: ALERT_TYPE
    ).message
  end
end