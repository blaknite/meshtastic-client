# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: meshtastic/cannedmessages.proto

require 'google/protobuf'


descriptor_data = "\n\x1fmeshtastic/cannedmessages.proto\x12\nmeshtastic\"-\n\x19\x43\x61nnedMessageModuleConfig\x12\x10\n\x08messages\x18\x01 \x01(\tBn\n\x13\x63om.geeksville.meshB\x19\x43\x61nnedMessageConfigProtosZ\"github.com/meshtastic/go/generated\xaa\x02\x14Meshtastic.Protobufs\xba\x02\x00\x62\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Meshtastic
  CannedMessageModuleConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.CannedMessageModuleConfig").msgclass
end