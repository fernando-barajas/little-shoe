# frozen_string_literal: true

require 'test_helper'

class LowInventoryNotifierTest < ActiveSupport::TestCase
  setup do
    @notifier = LowInventoryNotifier.new
  end

  test 'Broadcast if low stock' do
    create(:stock_item, count_on_hand: 5)

    assert_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end

  test 'Do not broadcast if enough stock' do
    create(:stock_item, count_on_hand: 50)

    assert_no_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end
end