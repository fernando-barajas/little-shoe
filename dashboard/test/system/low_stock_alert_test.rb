
# frozen_string_literal: true

require 'application_system_test_case'

class LowStockAlertTest < ApplicationSystemTestCase
  setup do
    @centre_eaton = create(:store, name: 'Aldo Centre Eaton')
    @product = create(:product)
  end

  test 'See low stock alert in Stores dashboard' do
    visit stores_url

    create(:stock_item, store: @centre_eaton, product: @product, count_on_hand: 5)
    sleep(1)
    InventoryManagerService.call

    sleep(2)
    assert_selector 'label', text: 'Low stock'
  end
end
