# frozen_string_literal: true

require "test_helper"

class StockItemTest < ActiveSupport::TestCase
  setup do
    @store = create(:store)
    @product = create(:product)
  end

  test 'broadcast inventory movement when after commit' do
    assert_turbo_stream_broadcasts @store do
      StockItem.create(store: @store, product: @product, count_on_hand: 10)
    end
  end
end