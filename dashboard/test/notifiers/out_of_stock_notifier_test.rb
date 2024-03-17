# frozen_string_literal: true

require 'test_helper'

class OutOfStockNotifierTest < ActiveSupport::TestCase
  setup do
    @notifier = OutOfStockNotifier.new
  end

  test 'Broadcast if out of stock' do
    create(:stock_item, count_on_hand: 0)

    assert_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end

  test 'Do not broadcast if not out of stock' do
    create(:stock_item, count_on_hand: 10)

    assert_no_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end
end