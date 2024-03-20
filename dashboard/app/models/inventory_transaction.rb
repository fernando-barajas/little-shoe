# frozen_string_literal: true

class InventoryTransaction < ApplicationRecord
  belongs_to :store
  belongs_to :product
end
