import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient client;

  Function(String topic, String message)? onMessageReceived;

  Future<bool> connect(String broker, String clientId) async {
    client = MqttServerClient(broker, clientId);
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.logging(on: false);

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean();

    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } catch (e) {
      return false;
    }

    client.updates?.listen((events) {
      final recMess = events[0].payload as MqttPublishMessage;
      final message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      final topic = events[0].topic;

      if (onMessageReceived != null) {
        onMessageReceived!(topic, message);
      }
    });

    return client.connectionStatus!.state == MqttConnectionState.connected;
  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atMostOnce);
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
  }

  void disconnect() {
    client.disconnect();
  }
}
