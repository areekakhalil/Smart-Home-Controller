import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mqtt_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool light = false;
  bool fan = false;
  bool ac = false;

  @override
  void initState() {
    super.initState();

    final mqtt = ref.read(mqttProvider);

    mqtt.subscribe("home/light");
    mqtt.subscribe("home/fan");
    mqtt.subscribe("home/ac");

    mqtt.onMessageReceived = (topic, message) {
      setState(() {
        if (topic == "home/light") light = message == "ON";
        if (topic == "home/fan") fan = message == "ON";
        if (topic == "home/ac") ac = message == "ON";
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    final mqtt = ref.read(mqttProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Smart Home Dashboard")),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Light"),
            value: light,
            onChanged: (val) {
              mqtt.publish("home/light", val ? "ON" : "OFF");
            },
          ),
          SwitchListTile(
            title: const Text("Fan"),
            value: fan,
            onChanged: (val) {
              mqtt.publish("home/fan", val ? "ON" : "OFF");
            },
          ),
          SwitchListTile(
            title: const Text("AC"),
            value: ac,
            onChanged: (val) {
              mqtt.publish("home/ac", val ? "ON" : "OFF");
            },
          ),
        ],
      ),
    );
  }
}
