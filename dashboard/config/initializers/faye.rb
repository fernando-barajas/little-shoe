# frozen_string_literal: true


Rails.application.configure do
  config.after_initialize do
    Thread.new do
      InventoryMonitoringService.start
    end
  end
end