# frozen_string_literal: true

require 'application_system_test_case'

class StoresInventoryDashboardTest < ApplicationSystemTestCase
  setup do
    @centre_eaton = create(:store, name: 'Aldo Centre Eaton')
    @maine_mall = create(:store, name: 'Aldo Maine Mall')
  end

  test 'Visit Inventory Dashboard' do
    visit stores_url

    assert_selector 'h1', text: "Aldo's stores"
    assert_selector 'a', text: @centre_eaton.name
    assert_selector 'a', text: @maine_mall.name
  end

  test 'Visit store invenory daashboard' do
    visit stores_url

    click_on @centre_eaton.name

    assert_selector 'a', text: "Aldo's stores"
    assert_selector 'span', text: @centre_eaton.name
  end
end