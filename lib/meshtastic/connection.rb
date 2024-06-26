# frozen_string_literal: true

class Meshtastic::Connection
  START1 = 0x94
  START2 = 0xC3
  HEADER_LEN = 4
  MAX_TO_FROM_RADIO_SIZE = 512

  def initialize
    @event_handlers = Hash.new { |hash, key| hash[key] = [] }
  end

  def monitor
    @rx_thread.join if @rx_thread
    @tx_thread.join if @tx_thread
  end

  def send_to_radio(to_radio)
    raise NotImplementedError
  end

  def read_from_radio
    raise NotImplementedError
  end

  def on(event, handler)
    @event_handlers[event] << handler
  end

  def emit(event, payload)
    @event_handlers[event].each do |handler|
      handler.call(payload)
    end
  end

  private

  def encode_packet(to_radio)
    bytes = Meshtastic::ToRadio.encode(to_radio)
    [0x94, 0xc3, 0x00, bytes.bytesize].pack("C*") + bytes
  end

  def decode_packet(packet)
    Meshtastic::FromRadio.decode(@receive_buffer[HEADER_LEN..].pack("C*"))
  end

  def process_send_queue
    @send_mutex.synchronize do
      unless to_radio = @send_queue.shift
        @send_observer.wait(@send_mutex)
        return
      end

      packet = encode_packet(to_radio)
      serialport.write(packet)

      @send_observer.signal if @send_queue.any?
    end
  end
end
