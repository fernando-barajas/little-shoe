# frozen_string_literal: true

class AlertPresenter
  def initialize(store_name:, product_name:, count_on_hand:, alert_type:, transfer_from_store: nil)
    @store_name = store_name
    @product_name = product_name
    @stock_item_count_on_hand = count_on_hand
    @transfer_from_store = transfer_from_store
    @alert_type = alert_type
  end

  def message
    build_alert_info
  end

  private

  attr_reader :store_name, :product_name, :stock_item_count_on_hand, :transfer_from_store, :alert_type

  def build_alert_info
    case alert_type
    when 'danger'
      { type: alert_type, title: 'Out of Stock', message: out_of_stock_message }
    when 'warning'
      { type: alert_type, title: 'Low stock', message: low_inventory_message }
    when 'info'
      { type: alert_type, title: 'Overstock', message: over_inventory_message }
    end
  end

  def out_of_stock_message
    "<strong>#{product_name}</strong> from <strong>#{store_name}</strong>
      is out of stock#{stock_transfer_message}"
  end

  def stock_transfer_message
    return unless transfer_from_store

    ", you could create a stock transfer from store <strong>#{transfer_from_store}</strong>"
  end

  def low_inventory_message
    "<strong>#{product_name}</strong> from <strong>#{store_name}</strong>
      is low on stock, there are #{stock_item_count_on_hand} pair of shoes for this model"
  end

  def over_inventory_message
    "<strong>#{product_name}</strong> from <strong>#{store_name}</strong>
      is overstock, there are #{stock_item_count_on_hand} pair of shoes for this model"
  end
end
