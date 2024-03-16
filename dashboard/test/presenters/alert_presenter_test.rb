# frozen_string_literal: true

require 'test_helper'

class AlertPresenterTest < ActiveSupport::TestCase
  test 'out of stock alert' do
    alert_message = AlertPresenter.new(
      store_name: 'ALDO Centre Eaton',
      product_name: 'BOZZA',
      count_on_hand: 0,
      alert_type: 'danger',
      transfer_from_store: 'ALDO Destiny USA Mall'
    ).message

    info = '<strong>BOZZA</strong> from <strong>ALDO Centre Eaton</strong> '\
      'is out of stock, you could create a stock transfer from store '\
      '<strong>ALDO Destiny USA Mall</strong>'

    assert_equal 'danger', alert_message[:type]
    assert_equal 'Out of Stock', alert_message[:title]
    assert_equal info, alert_message[:message]
  end

  test 'low inventory alert' do
    alert_message = AlertPresenter.new(
      store_name: 'ALDO Centre Eaton',
      product_name: 'BOZZA',
      count_on_hand: 10,
      alert_type: 'warning'
    ).message

    info = '<strong>BOZZA</strong> from <strong>ALDO Centre Eaton</strong> '\
      'is low on stock, there are 10 pair of shoes for this model'

    assert_equal 'warning', alert_message[:type]
    assert_equal 'Low stock', alert_message[:title]
    assert_equal info, alert_message[:message]
  end

  test 'Overstock alert' do
    alert_message = AlertPresenter.new(
      store_name: 'ALDO Centre Eaton',
      product_name: 'BOZZA',
      count_on_hand: 100,
      alert_type: 'info'
    ).message

    info = '<strong>BOZZA</strong> from <strong>ALDO Centre Eaton</strong> '\
      'is overstock, there are 100 pair of shoes for this model'

    assert_equal 'info', alert_message[:type]
    assert_equal 'Overstock', alert_message[:title]
    assert_equal info, alert_message[:message]
  end

  test 'invalit type of alert' do
    alert_message = AlertPresenter.new(
      store_name: 'ALDO Centre Eaton',
      product_name: 'BOZZA',
      count_on_hand: 100,
      alert_type: 'low'
    ).message

    assert_nil alert_message
  end
end