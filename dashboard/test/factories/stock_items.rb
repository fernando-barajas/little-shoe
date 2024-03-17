# frozen_string_literal: true

FactoryBot.define do
  factory :stock_item do
    association :store, factory: :store
    association :product, factory: :product
    count_on_hand { 1 }
  end
end
