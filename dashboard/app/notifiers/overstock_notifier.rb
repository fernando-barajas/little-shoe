# frozen_string_literal: true

class OverstockNotifier < BaseNotifier
  def notify
    out_of_stock_alerts = build_alert_messages
    return if out_of_stock_alerts.blank?

    broadcast_alert(out_of_stock_alerts, OVER_INVENROTY_ALERT_TARGET)
  end

  private

  ALERT_TYPE = 'info'

  def build_alert_messages
    out_of_stock_alerts = []

    StockItem.overstock.each do |stock_item|
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