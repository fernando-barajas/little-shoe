# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :stock_items
end
