# frozen_string_literal: true

require 'application_system_test_case'

class OverstockAlertTest < ApplicationSystemTestCase
  setup do
    @centre_eaton = create(:store, name: 'Aldo Centre Eaton')
    @product = create(:product)
  end

  test 'See overstock alert in Stores dashboard' do
    visit stores_url

    create(:stock_item, store: @centre_eaton, product: @product, count_on_hand: 100)
    sleep(1)
    InventoryManagerService.call

    sleep(2)
    assert_selector 'label', text: 'Overstock'
  end
end