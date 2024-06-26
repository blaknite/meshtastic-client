# frozen_string_literal: true

require_relative "meshtastic/version"
require_relative "meshtastic/mesh_pb"
require_relative "meshtastic/connection"
require_relative "meshtastic/connection/serial"
require_relative "meshtastic/device"

module Meshtastic
  def self.connect(interface, options)
    connection = case interface
                 when :serial
                   Meshtastic::Connection::Serial.new(port: options[:port])
                 else
                   raise "Unknown interface"
                 end

    Meshtastic::Device.new(connection: connection)
  end
end
