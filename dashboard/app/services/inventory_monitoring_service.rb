# frozen_string_literal: true

require 'faye/websocket'
require 'eventmachine'
require 'json'

class InventoryMonitoringService
  class << self
    include Wisper::Publisher

    def start
      Thread.new do
        EM.run {
          ws = Faye::WebSocket::Client.new('ws://localhost:8080/')

          ws.on :message do |event|
            data = JSON.parse(event.data)
            broadcast(:inventory_update, data)
          end
        }
      end
    end
  end
end