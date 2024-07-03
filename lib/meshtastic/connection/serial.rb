# frozen_string_literal: true

require "rubyserial"

class Meshtastic::Connection::Serial < Meshtastic::Connection
  def initialize(port:)
    super()

    @receive_buffer = []
    @send_queue = []
    @send_mutex = Mutex.new
    @send_observer = ConditionVariable.new
    @serialport = ::Serial.new(port, 115_200)

    data = Array.new(32, 0xC3).pack("C*")

    @serialport.write(data)

    @rx_thread = Thread.new do
      loop do
        read_from_radio
      end
    end

    @tx_thread = Thread.new do
      loop do
        process_send_queue
      end
    end
  end

  def send_to_radio(to_radio)
    @send_mutex.synchronize do
      @send_queue << to_radio
      @send_observer.signal
    end
  end

  def read_from_radio
    c = @serialport.getbyte
    rx_ptr = @receive_buffer.length

    return unless c

    @receive_buffer << c

    case
    when rx_ptr == 0
      @receive_buffer.clear unless c == START1
    when rx_ptr == 1
      @receive_buffer.clear unless c == START2
    when rx_ptr > HEADER_LEN
      packet_len = (@receive_buffer[2] << 8) + @receive_buffer[3]

      if packet_len > MAX_TO_FROM_RADIO_SIZE
        @receive_buffer.clear
        return
      end

      return if rx_ptr < HEADER_LEN + packet_len - 1

      begin
        from_radio = decode_packet(@receive_buffer[HEADER_LEN..].pack("C*"))
        emit(:from_radio, from_radio)
      rescue Google::Protobuf::ParseError => e
        puts e
      end

      @receive_buffer.clear
    end
  end

  private

  def process_send_queue
    @send_mutex.synchronize do
      unless from_radio = @send_queue.shift
        @send_observer.wait(@send_mutex)
        return
      end

      packet = encode_packet(from_radio)
      @serialport.write(packet)
    end
  end
end
