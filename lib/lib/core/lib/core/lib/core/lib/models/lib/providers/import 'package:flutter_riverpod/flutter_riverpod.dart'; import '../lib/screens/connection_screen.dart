import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mqtt_provider.dart';
import 'dashboard_screen.dart';

class ConnectionScreen extends ConsumerStatefulWidget {
  const ConnectionScreen({super.key});

  @override
  ConsumerState<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends ConsumerState<ConnectionScreen> {
  final brokerController = TextEditingController(text: "test.mosquitto.org");
  final clientIdController = TextEditingController(text: "flutter_client_1");

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final mqtt = ref.read(mqttProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("MQTT Connection")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: brokerController,
              decoration: const InputDecoration(labelText: "Broker"),
            ),
            TextField(
              controller: clientIdController,
              decoration: const InputDecoration(labelText: "Client ID"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() => loading = true);

                bool connected = await mqtt.connect(
                  brokerController.text,
                  clientIdController.text,
                );

                setState(() => loading = false);

                if (connected) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DashboardScreen()),
                  );
                }
              },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("Connect"),
            )
          ],
        ),
      ),
    );
  }
}
