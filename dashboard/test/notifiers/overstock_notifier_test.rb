# frozen_string_literal: true

require 'test_helper'

class OverstockNotifierTest < ActiveSupport::TestCase
  setup do
    @notifier = OverstockNotifier.new
  end

  test 'Broadcast if overstock' do
    create(:stock_item, count_on_hand: 100)

    assert_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end

  test 'Do not broadcast if not overstock' do
    create(:stock_item, count_on_hand: 50)

    assert_no_turbo_stream_broadcasts 'stock_item' do
      @notifier.notify
    end
  end
end