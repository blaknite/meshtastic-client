# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: meshtastic/mesh.proto

require 'google/protobuf'

require 'meshtastic/channel_pb'
require 'meshtastic/config_pb'
require 'meshtastic/module_config_pb'
require 'meshtastic/portnums_pb'
require 'meshtastic/telemetry_pb'
require 'meshtastic/xmodem_pb'


descriptor_data = "\n\x15meshtastic/mesh.proto\x12\nmeshtastic\x1a\x18meshtastic/channel.proto\x1a\x17meshtastic/config.proto\x1a\x1emeshtastic/module_config.proto\x1a\x19meshtastic/portnums.proto\x1a\x1ameshtastic/telemetry.proto\x1a\x17meshtastic/xmodem.proto\"\xe5\x05\n\x08Position\x12\x12\n\nlatitude_i\x18\x01 \x01(\x0f\x12\x13\n\x0blongitude_i\x18\x02 \x01(\x0f\x12\x10\n\x08\x61ltitude\x18\x03 \x01(\x05\x12\x0c\n\x04time\x18\x04 \x01(\x07\x12\x37\n\x0flocation_source\x18\x05 \x01(\x0e\x32\x1e.meshtastic.Position.LocSource\x12\x37\n\x0f\x61ltitude_source\x18\x06 \x01(\x0e\x32\x1e.meshtastic.Position.AltSource\x12\x11\n\ttimestamp\x18\x07 \x01(\x07\x12\x1f\n\x17timestamp_millis_adjust\x18\x08 \x01(\x05\x12\x14\n\x0c\x61ltitude_hae\x18\t \x01(\x11\x12#\n\x1b\x61ltitude_geoidal_separation\x18\n \x01(\x11\x12\x0c\n\x04PDOP\x18\x0b \x01(\r\x12\x0c\n\x04HDOP\x18\x0c \x01(\r\x12\x0c\n\x04VDOP\x18\r \x01(\r\x12\x14\n\x0cgps_accuracy\x18\x0e \x01(\r\x12\x14\n\x0cground_speed\x18\x0f \x01(\r\x12\x14\n\x0cground_track\x18\x10 \x01(\r\x12\x13\n\x0b\x66ix_quality\x18\x11 \x01(\r\x12\x10\n\x08\x66ix_type\x18\x12 \x01(\r\x12\x14\n\x0csats_in_view\x18\x13 \x01(\r\x12\x11\n\tsensor_id\x18\x14 \x01(\r\x12\x13\n\x0bnext_update\x18\x15 \x01(\r\x12\x12\n\nseq_number\x18\x16 \x01(\r\x12\x16\n\x0eprecision_bits\x18\x17 \x01(\r\"N\n\tLocSource\x12\r\n\tLOC_UNSET\x10\x00\x12\x0e\n\nLOC_MANUAL\x10\x01\x12\x10\n\x0cLOC_INTERNAL\x10\x02\x12\x10\n\x0cLOC_EXTERNAL\x10\x03\"b\n\tAltSource\x12\r\n\tALT_UNSET\x10\x00\x12\x0e\n\nALT_MANUAL\x10\x01\x12\x10\n\x0c\x41LT_INTERNAL\x10\x02\x12\x10\n\x0c\x41LT_EXTERNAL\x10\x03\x12\x12\n\x0e\x41LT_BAROMETRIC\x10\x04\"\xc4\x01\n\x04User\x12\n\n\x02id\x18\x01 \x01(\t\x12\x11\n\tlong_name\x18\x02 \x01(\t\x12\x12\n\nshort_name\x18\x03 \x01(\t\x12\x13\n\x07macaddr\x18\x04 \x01(\x0c\x42\x02\x18\x01\x12+\n\x08hw_model\x18\x05 \x01(\x0e\x32\x19.meshtastic.HardwareModel\x12\x13\n\x0bis_licensed\x18\x06 \x01(\x08\x12\x32\n\x04role\x18\x07 \x01(\x0e\x32$.meshtastic.Config.DeviceConfig.Role\"\x1f\n\x0eRouteDiscovery\x12\r\n\x05route\x18\x01 \x03(\x07\"\xfc\x02\n\x07Routing\x12\x33\n\rroute_request\x18\x01 \x01(\x0b\x32\x1a.meshtastic.RouteDiscoveryH\x00\x12\x31\n\x0broute_reply\x18\x02 \x01(\x0b\x32\x1a.meshtastic.RouteDiscoveryH\x00\x12\x31\n\x0c\x65rror_reason\x18\x03 \x01(\x0e\x32\x19.meshtastic.Routing.ErrorH\x00\"\xca\x01\n\x05\x45rror\x12\x08\n\x04NONE\x10\x00\x12\x0c\n\x08NO_ROUTE\x10\x01\x12\x0b\n\x07GOT_NAK\x10\x02\x12\x0b\n\x07TIMEOUT\x10\x03\x12\x10\n\x0cNO_INTERFACE\x10\x04\x12\x12\n\x0eMAX_RETRANSMIT\x10\x05\x12\x0e\n\nNO_CHANNEL\x10\x06\x12\r\n\tTOO_LARGE\x10\x07\x12\x0f\n\x0bNO_RESPONSE\x10\x08\x12\x14\n\x10\x44UTY_CYCLE_LIMIT\x10\t\x12\x0f\n\x0b\x42\x41\x44_REQUEST\x10 \x12\x12\n\x0eNOT_AUTHORIZED\x10!B\t\n\x07variant\"\xa7\x01\n\x04\x44\x61ta\x12$\n\x07portnum\x18\x01 \x01(\x0e\x32\x13.meshtastic.PortNum\x12\x0f\n\x07payload\x18\x02 \x01(\x0c\x12\x15\n\rwant_response\x18\x03 \x01(\x08\x12\x0c\n\x04\x64\x65st\x18\x04 \x01(\x07\x12\x0e\n\x06source\x18\x05 \x01(\x07\x12\x12\n\nrequest_id\x18\x06 \x01(\x07\x12\x10\n\x08reply_id\x18\x07 \x01(\x07\x12\r\n\x05\x65moji\x18\x08 \x01(\x07\"\x93\x01\n\x08Waypoint\x12\n\n\x02id\x18\x01 \x01(\r\x12\x12\n\nlatitude_i\x18\x02 \x01(\x0f\x12\x13\n\x0blongitude_i\x18\x03 \x01(\x0f\x12\x0e\n\x06\x65xpire\x18\x04 \x01(\r\x12\x11\n\tlocked_to\x18\x05 \x01(\r\x12\x0c\n\x04name\x18\x06 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x07 \x01(\t\x12\x0c\n\x04icon\x18\x08 \x01(\x07\"l\n\x16MqttClientProxyMessage\x12\r\n\x05topic\x18\x01 \x01(\t\x12\x0e\n\x04\x64\x61ta\x18\x02 \x01(\x0cH\x00\x12\x0e\n\x04text\x18\x03 \x01(\tH\x00\x12\x10\n\x08retained\x18\x04 \x01(\x08\x42\x11\n\x0fpayload_variant\"\x95\x04\n\nMeshPacket\x12\x0c\n\x04\x66rom\x18\x01 \x01(\x07\x12\n\n\x02to\x18\x02 \x01(\x07\x12\x0f\n\x07\x63hannel\x18\x03 \x01(\r\x12#\n\x07\x64\x65\x63oded\x18\x04 \x01(\x0b\x32\x10.meshtastic.DataH\x00\x12\x13\n\tencrypted\x18\x05 \x01(\x0cH\x00\x12\n\n\x02id\x18\x06 \x01(\x07\x12\x0f\n\x07rx_time\x18\x07 \x01(\x07\x12\x0e\n\x06rx_snr\x18\x08 \x01(\x02\x12\x11\n\thop_limit\x18\t \x01(\r\x12\x10\n\x08want_ack\x18\n \x01(\x08\x12\x31\n\x08priority\x18\x0b \x01(\x0e\x32\x1f.meshtastic.MeshPacket.Priority\x12\x0f\n\x07rx_rssi\x18\x0c \x01(\x05\x12\x33\n\x07\x64\x65layed\x18\r \x01(\x0e\x32\x1e.meshtastic.MeshPacket.DelayedB\x02\x18\x01\x12\x10\n\x08via_mqtt\x18\x0e \x01(\x08\x12\x11\n\thop_start\x18\x0f \x01(\r\"[\n\x08Priority\x12\t\n\x05UNSET\x10\x00\x12\x07\n\x03MIN\x10\x01\x12\x0e\n\nBACKGROUND\x10\n\x12\x0b\n\x07\x44\x45\x46\x41ULT\x10@\x12\x0c\n\x08RELIABLE\x10\x46\x12\x07\n\x03\x41\x43K\x10x\x12\x07\n\x03MAX\x10\x7f\"B\n\x07\x44\x65layed\x12\x0c\n\x08NO_DELAY\x10\x00\x12\x15\n\x11\x44\x45LAYED_BROADCAST\x10\x01\x12\x12\n\x0e\x44\x45LAYED_DIRECT\x10\x02\x42\x11\n\x0fpayload_variant\"\xfe\x01\n\x08NodeInfo\x12\x0b\n\x03num\x18\x01 \x01(\r\x12\x1e\n\x04user\x18\x02 \x01(\x0b\x32\x10.meshtastic.User\x12&\n\x08position\x18\x03 \x01(\x0b\x32\x14.meshtastic.Position\x12\x0b\n\x03snr\x18\x04 \x01(\x02\x12\x12\n\nlast_heard\x18\x05 \x01(\x07\x12\x31\n\x0e\x64\x65vice_metrics\x18\x06 \x01(\x0b\x32\x19.meshtastic.DeviceMetrics\x12\x0f\n\x07\x63hannel\x18\x07 \x01(\r\x12\x10\n\x08via_mqtt\x18\x08 \x01(\x08\x12\x11\n\thops_away\x18\t \x01(\r\x12\x13\n\x0bis_favorite\x18\n \x01(\x08\"P\n\nMyNodeInfo\x12\x13\n\x0bmy_node_num\x18\x01 \x01(\r\x12\x14\n\x0creboot_count\x18\x08 \x01(\r\x12\x17\n\x0fmin_app_version\x18\x0b \x01(\r\"\xc0\x01\n\tLogRecord\x12\x0f\n\x07message\x18\x01 \x01(\t\x12\x0c\n\x04time\x18\x02 \x01(\x07\x12\x0e\n\x06source\x18\x03 \x01(\t\x12*\n\x05level\x18\x04 \x01(\x0e\x32\x1b.meshtastic.LogRecord.Level\"X\n\x05Level\x12\t\n\x05UNSET\x10\x00\x12\x0c\n\x08\x43RITICAL\x10\x32\x12\t\n\x05\x45RROR\x10(\x12\x0b\n\x07WARNING\x10\x1e\x12\x08\n\x04INFO\x10\x14\x12\t\n\x05\x44\x45\x42UG\x10\n\x12\t\n\x05TRACE\x10\x05\"P\n\x0bQueueStatus\x12\x0b\n\x03res\x18\x01 \x01(\x05\x12\x0c\n\x04\x66ree\x18\x02 \x01(\r\x12\x0e\n\x06maxlen\x18\x03 \x01(\r\x12\x16\n\x0emesh_packet_id\x18\x04 \x01(\r\"\xdb\x04\n\tFromRadio\x12\n\n\x02id\x18\x01 \x01(\r\x12(\n\x06packet\x18\x02 \x01(\x0b\x32\x16.meshtastic.MeshPacketH\x00\x12)\n\x07my_info\x18\x03 \x01(\x0b\x32\x16.meshtastic.MyNodeInfoH\x00\x12)\n\tnode_info\x18\x04 \x01(\x0b\x32\x14.meshtastic.NodeInfoH\x00\x12$\n\x06\x63onfig\x18\x05 \x01(\x0b\x32\x12.meshtastic.ConfigH\x00\x12+\n\nlog_record\x18\x06 \x01(\x0b\x32\x15.meshtastic.LogRecordH\x00\x12\x1c\n\x12\x63onfig_complete_id\x18\x07 \x01(\rH\x00\x12\x12\n\x08rebooted\x18\x08 \x01(\x08H\x00\x12\x30\n\x0cmoduleConfig\x18\t \x01(\x0b\x32\x18.meshtastic.ModuleConfigH\x00\x12&\n\x07\x63hannel\x18\n \x01(\x0b\x32\x13.meshtastic.ChannelH\x00\x12.\n\x0bqueueStatus\x18\x0b \x01(\x0b\x32\x17.meshtastic.QueueStatusH\x00\x12*\n\x0cxmodemPacket\x18\x0c \x01(\x0b\x32\x12.meshtastic.XModemH\x00\x12.\n\x08metadata\x18\r \x01(\x0b\x32\x1a.meshtastic.DeviceMetadataH\x00\x12\x44\n\x16mqttClientProxyMessage\x18\x0e \x01(\x0b\x32\".meshtastic.MqttClientProxyMessageH\x00\x42\x11\n\x0fpayload_variant\"\x94\x02\n\x07ToRadio\x12(\n\x06packet\x18\x01 \x01(\x0b\x32\x16.meshtastic.MeshPacketH\x00\x12\x18\n\x0ewant_config_id\x18\x03 \x01(\rH\x00\x12\x14\n\ndisconnect\x18\x04 \x01(\x08H\x00\x12*\n\x0cxmodemPacket\x18\x05 \x01(\x0b\x32\x12.meshtastic.XModemH\x00\x12\x44\n\x16mqttClientProxyMessage\x18\x06 \x01(\x0b\x32\".meshtastic.MqttClientProxyMessageH\x00\x12*\n\theartbeat\x18\x07 \x01(\x0b\x32\x15.meshtastic.HeartbeatH\x00\x42\x11\n\x0fpayload_variant\"@\n\nCompressed\x12$\n\x07portnum\x18\x01 \x01(\x0e\x32\x13.meshtastic.PortNum\x12\x0c\n\x04\x64\x61ta\x18\x02 \x01(\x0c\"\x87\x01\n\x0cNeighborInfo\x12\x0f\n\x07node_id\x18\x01 \x01(\r\x12\x17\n\x0flast_sent_by_id\x18\x02 \x01(\r\x12$\n\x1cnode_broadcast_interval_secs\x18\x03 \x01(\r\x12\'\n\tneighbors\x18\x04 \x03(\x0b\x32\x14.meshtastic.Neighbor\"d\n\x08Neighbor\x12\x0f\n\x07node_id\x18\x01 \x01(\r\x12\x0b\n\x03snr\x18\x02 \x01(\x02\x12\x14\n\x0clast_rx_time\x18\x03 \x01(\x07\x12$\n\x1cnode_broadcast_interval_secs\x18\x04 \x01(\r\"\xad\x02\n\x0e\x44\x65viceMetadata\x12\x18\n\x10\x66irmware_version\x18\x01 \x01(\t\x12\x1c\n\x14\x64\x65vice_state_version\x18\x02 \x01(\r\x12\x13\n\x0b\x63\x61nShutdown\x18\x03 \x01(\x08\x12\x0f\n\x07hasWifi\x18\x04 \x01(\x08\x12\x14\n\x0chasBluetooth\x18\x05 \x01(\x08\x12\x13\n\x0bhasEthernet\x18\x06 \x01(\x08\x12\x32\n\x04role\x18\x07 \x01(\x0e\x32$.meshtastic.Config.DeviceConfig.Role\x12\x16\n\x0eposition_flags\x18\x08 \x01(\r\x12+\n\x08hw_model\x18\t \x01(\x0e\x32\x19.meshtastic.HardwareModel\x12\x19\n\x11hasRemoteHardware\x18\n \x01(\x08\"\x0b\n\tHeartbeat\"U\n\x15NodeRemoteHardwarePin\x12\x10\n\x08node_num\x18\x01 \x01(\r\x12*\n\x03pin\x18\x02 \x01(\x0b\x32\x1d.meshtastic.RemoteHardwarePin\"e\n\x0e\x43hunkedPayload\x12\x12\n\npayload_id\x18\x01 \x01(\r\x12\x13\n\x0b\x63hunk_count\x18\x02 \x01(\r\x12\x13\n\x0b\x63hunk_index\x18\x03 \x01(\r\x12\x15\n\rpayload_chunk\x18\x04 \x01(\x0c\"\x1f\n\rresend_chunks\x12\x0e\n\x06\x63hunks\x18\x01 \x03(\r\"\xaa\x01\n\x16\x43hunkedPayloadResponse\x12\x12\n\npayload_id\x18\x01 \x01(\r\x12\x1a\n\x10request_transfer\x18\x02 \x01(\x08H\x00\x12\x19\n\x0f\x61\x63\x63\x65pt_transfer\x18\x03 \x01(\x08H\x00\x12\x32\n\rresend_chunks\x18\x04 \x01(\x0b\x32\x19.meshtastic.resend_chunksH\x00\x42\x11\n\x0fpayload_variant*\xab\t\n\rHardwareModel\x12\t\n\x05UNSET\x10\x00\x12\x0c\n\x08TLORA_V2\x10\x01\x12\x0c\n\x08TLORA_V1\x10\x02\x12\x12\n\x0eTLORA_V2_1_1P6\x10\x03\x12\t\n\x05TBEAM\x10\x04\x12\x0f\n\x0bHELTEC_V2_0\x10\x05\x12\x0e\n\nTBEAM_V0P7\x10\x06\x12\n\n\x06T_ECHO\x10\x07\x12\x10\n\x0cTLORA_V1_1P3\x10\x08\x12\x0b\n\x07RAK4631\x10\t\x12\x0f\n\x0bHELTEC_V2_1\x10\n\x12\r\n\tHELTEC_V1\x10\x0b\x12\x18\n\x14LILYGO_TBEAM_S3_CORE\x10\x0c\x12\x0c\n\x08RAK11200\x10\r\x12\x0b\n\x07NANO_G1\x10\x0e\x12\x12\n\x0eTLORA_V2_1_1P8\x10\x0f\x12\x0f\n\x0bTLORA_T3_S3\x10\x10\x12\x14\n\x10NANO_G1_EXPLORER\x10\x11\x12\x11\n\rNANO_G2_ULTRA\x10\x12\x12\r\n\tLORA_TYPE\x10\x13\x12\x0b\n\x07WIPHONE\x10\x14\x12\x0e\n\nWIO_WM1110\x10\x15\x12\x0b\n\x07RAK2560\x10\x16\x12\x13\n\x0fHELTEC_HRU_3601\x10\x17\x12\x0e\n\nSTATION_G1\x10\x19\x12\x0c\n\x08RAK11310\x10\x1a\x12\x14\n\x10SENSELORA_RP2040\x10\x1b\x12\x10\n\x0cSENSELORA_S3\x10\x1c\x12\r\n\tCANARYONE\x10\x1d\x12\x0f\n\x0bRP2040_LORA\x10\x1e\x12\x0e\n\nSTATION_G2\x10\x1f\x12\x11\n\rLORA_RELAY_V1\x10 \x12\x0e\n\nNRF52840DK\x10!\x12\x07\n\x03PPR\x10\"\x12\x0f\n\x0bGENIEBLOCKS\x10#\x12\x11\n\rNRF52_UNKNOWN\x10$\x12\r\n\tPORTDUINO\x10%\x12\x0f\n\x0b\x41NDROID_SIM\x10&\x12\n\n\x06\x44IY_V1\x10\'\x12\x15\n\x11NRF52840_PCA10059\x10(\x12\n\n\x06\x44R_DEV\x10)\x12\x0b\n\x07M5STACK\x10*\x12\r\n\tHELTEC_V3\x10+\x12\x11\n\rHELTEC_WSL_V3\x10,\x12\x13\n\x0f\x42\x45TAFPV_2400_TX\x10-\x12\x17\n\x13\x42\x45TAFPV_900_NANO_TX\x10.\x12\x0c\n\x08RPI_PICO\x10/\x12\x1b\n\x17HELTEC_WIRELESS_TRACKER\x10\x30\x12\x19\n\x15HELTEC_WIRELESS_PAPER\x10\x31\x12\n\n\x06T_DECK\x10\x32\x12\x0e\n\nT_WATCH_S3\x10\x33\x12\x11\n\rPICOMPUTER_S3\x10\x34\x12\x0f\n\x0bHELTEC_HT62\x10\x35\x12\x12\n\x0e\x45\x42YTE_ESP32_S3\x10\x36\x12\x11\n\rESP32_S3_PICO\x10\x37\x12\r\n\tCHATTER_2\x10\x38\x12\x1e\n\x1aHELTEC_WIRELESS_PAPER_V1_0\x10\x39\x12 \n\x1cHELTEC_WIRELESS_TRACKER_V1_0\x10:\x12\x0b\n\x07UNPHONE\x10;\x12\x0c\n\x08TD_LORAC\x10<\x12\x13\n\x0f\x43\x44\x45\x42YTE_EORA_S3\x10=\x12\x0f\n\x0bTWC_MESH_V4\x10>\x12\x16\n\x12NRF52_PROMICRO_DIY\x10?\x12\x1f\n\x1bRADIOMASTER_900_BANDIT_NANO\x10@\x12\x1c\n\x18HELTEC_CAPSULE_SENSOR_V3\x10\x41\x12\x0f\n\nPRIVATE_HW\x10\xff\x01*,\n\tConstants\x12\x08\n\x04ZERO\x10\x00\x12\x15\n\x10\x44\x41TA_PAYLOAD_LEN\x10\xed\x01*\xee\x01\n\x11\x43riticalErrorCode\x12\x08\n\x04NONE\x10\x00\x12\x0f\n\x0bTX_WATCHDOG\x10\x01\x12\x14\n\x10SLEEP_ENTER_WAIT\x10\x02\x12\x0c\n\x08NO_RADIO\x10\x03\x12\x0f\n\x0bUNSPECIFIED\x10\x04\x12\x15\n\x11UBLOX_UNIT_FAILED\x10\x05\x12\r\n\tNO_AXP192\x10\x06\x12\x19\n\x15INVALID_RADIO_SETTING\x10\x07\x12\x13\n\x0fTRANSMIT_FAILED\x10\x08\x12\x0c\n\x08\x42ROWNOUT\x10\t\x12\x12\n\x0eSX1262_FAILURE\x10\n\x12\x11\n\rRADIO_SPI_BUG\x10\x0b\x42_\n\x13\x63om.geeksville.meshB\nMeshProtosZ\"github.com/meshtastic/go/generated\xaa\x02\x14Meshtastic.Protobufs\xba\x02\x00\x62\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Meshtastic
  Position = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Position").msgclass
  Position::LocSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Position.LocSource").enummodule
  Position::AltSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Position.AltSource").enummodule
  User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.User").msgclass
  RouteDiscovery = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.RouteDiscovery").msgclass
  Routing = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Routing").msgclass
  Routing::Error = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Routing.Error").enummodule
  Data = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Data").msgclass
  Waypoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Waypoint").msgclass
  MqttClientProxyMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.MqttClientProxyMessage").msgclass
  MeshPacket = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.MeshPacket").msgclass
  MeshPacket::Priority = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.MeshPacket.Priority").enummodule
  MeshPacket::Delayed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.MeshPacket.Delayed").enummodule
  NodeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.NodeInfo").msgclass
  MyNodeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.MyNodeInfo").msgclass
  LogRecord = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.LogRecord").msgclass
  LogRecord::Level = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.LogRecord.Level").enummodule
  QueueStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.QueueStatus").msgclass
  FromRadio = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.FromRadio").msgclass
  ToRadio = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.ToRadio").msgclass
  Compressed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Compressed").msgclass
  NeighborInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.NeighborInfo").msgclass
  Neighbor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Neighbor").msgclass
  DeviceMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.DeviceMetadata").msgclass
  Heartbeat = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Heartbeat").msgclass
  NodeRemoteHardwarePin = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.NodeRemoteHardwarePin").msgclass
  ChunkedPayload = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.ChunkedPayload").msgclass
  Resend_chunks = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.resend_chunks").msgclass
  ChunkedPayloadResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.ChunkedPayloadResponse").msgclass
  HardwareModel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.HardwareModel").enummodule
  Constants = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.Constants").enummodule
  CriticalErrorCode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("meshtastic.CriticalErrorCode").enummodule
end