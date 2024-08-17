# frozen_string_literal: true

require "base64"

class Meshtastic::Device
  attr_reader :nodes

  BROADCAST = 0xffffffff

  def initialize(connection:)
    @connection = connection
    @my_info = nil
    @nodes = {}
    @channels = {}
    @config_complete = false
    @local_config = {}
    @event_handlers = Hash.new { |hash, key| hash[key] = [] }
    @acks = Set.new
    @acks_monitor = Monitor.new

    connection.on(:from_radio, lambda { |from_radio|
      handle_from_radio(from_radio)
    })

    request_config

    sleep 0.1 until @config_complete

    heartbeat
  end

  def on(event, handler)
    @event_handlers[event] << handler
  end

  def info
    @my_info
  end

  def config
    @local_config
  end

  def node_num
    return nil unless @my_info

    @my_info.my_node_num
  end

  def request_position(destination:)
    send_packet(
      payload: "",
      portnum: Meshtastic::PortNum::POSITION_APP,
      destination: destination
    )
  end

  def send_message(data, destination:, immediate: false)
    return unless data

    send_packet(
      payload: data[0..227],
      portnum: Meshtastic::PortNum::TEXT_MESSAGE_APP,
      destination: destination,
      immediate: immediate
    )
  end

  def send_packet(payload:, portnum:, destination:, channel: 0, hop_limit: nil, want_ack: true, want_response: false, immediate: false)
    packet = Meshtastic::MeshPacket.new

    packet.decoded = Meshtastic::Data.new(
      payload: payload,
      portnum: portnum,
      want_response: want_response
    )
    packet.from = node_num
    packet.to = case destination
                when "broadcast"
                  BROADCAST
                when "self"
                  node_num
                else
                  destination
                end
    packet.id = generate_packet_id
    packet.want_ack = want_ack
    packet.channel = channel
    packet.hop_limit = hop_limit || config[:lora]&.hop_limit || 3
    packet.hop_start = packet.hop_limit

    to_radio = Meshtastic::ToRadio.new

    to_radio.packet = packet

    if want_ack
      Thread.new do
        send_with_ack(to_radio, immediate: immediate)
      end

      return
    end

    @connection.send_to_radio(to_radio, immediate: immediate)
  end

  private

  def broadcast(event, payload)
    @event_handlers[event].each do |handler|
      handler.call(payload)
    end
  end

  def heartbeat
    return unless @local_config[:power]

    heartbeat_interval = @local_config[:power].ls_secs / 2

    Thread.new do
      loop do
        sleep heartbeat_interval
        to_radio = Meshtastic::ToRadio.new
        to_radio.heartbeat = Meshtastic::Heartbeat.new
        @connection.send_to_radio(to_radio)
      end
    end
  end

  def request_config
    @my_info = nil
    @nodes = {}

    to_radio = Meshtastic::ToRadio.new

    @config_id ||= rand(0..0xFFFFFFFF)

    to_radio.want_config_id = @config_id

    @connection.send_to_radio(to_radio)
  end

  def handle_from_radio(from_radio)
    broadcast(from_radio.payload_variant, from_radio[from_radio.payload_variant.to_s])

    case from_radio.payload_variant
    when :my_info
      @my_info = from_radio.my_info
    when :node_info
      node_info = from_radio.node_info
      @nodes[node_info.num] = node_info
    when :config
      config = from_radio.config
      @local_config[config.payload_variant] = config[config.payload_variant.to_s]
    when :channel
      channel = from_radio.channel
      @channels[channel.index] = channel
    when :config_complete_id
      @config_complete = from_radio.config_complete_id == @config_id
    when :packet
      packet = from_radio.packet

      return unless packet.payload_variant == :decoded
      return unless packet.channel == 0 && packet.to == node_num

      case packet.decoded.portnum
      when :ROUTING_APP
        @acks_monitor.synchronize do
          @acks << packet.decoded.request_id.to_i
        end
      end
    end
  end

  def generate_packet_id
    @current_packet_id = rand(0..0xFFFFFFFF)
  end

  def send_with_ack(to_radio, immediate: false)
    attempt = 0

    until attempt == 5
      @connection.send_to_radio(to_radio, immediate: immediate)

      5.times do
        sleep 1

        @acks_monitor.synchronize do
          if @acks.include?(to_radio.packet.id)
            @acks.delete(to_radio.packet.id)
            return
          end
        end
      end

      attempt += 1
    end
  end
end
