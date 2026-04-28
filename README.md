📌 Project Overview
This is a Flutter-based Smart Home Controller app that uses MQTT protocol to control and monitor smart devices like:
Light 💡
Fan 🌬️
AC ❄️
The app provides real-time communication between mobile app and MQTT broker.

⚙️ Features
🔌 MQTT Connection Setup (Broker + Client ID)
💡 Light ON/OFF control
🌬️ Fan ON/OFF control
❄️ AC ON/OFF control
🔄 Real-time state updates using MQTT
📡 Live communication via topics

🧩 Project Structure
lib/
│
├── main.dart
│
├── core/
│   └── mqtt_service.dart
│
├── models/
│   └── device_model.dart
│
├── providers/
│   └── mqtt_provider.dart
│
└── screens/
    ├── connection_screen.dart
    └── dashboard_screen.dart
    
🌐 MQTT Configuration
Broker Used:
test.mosquitto.org
Port:
1883
📡 MQTT Topics
Device	Topic	Payload
Light	home/light	ON/OFF
Fan	home/fan	ON/OFF
AC	home/ac	ON/OFF

🧪 How to Test
Step 1: Run MQTTX
Use MQTTX or any MQTT client.
Step 2: Connect
Broker: test.mosquitto.org
Port: 1883
Step 3: Subscribe Topics
home/light
home/fan
home/ac
Step 4: Test Publishing
Publish messages like:
ON
OFF
Example:
Publish ON → Light turns ON in app
Publish OFF → Light turns OFF in app
📱 App Flow
Open App
Enter Broker URL + Client ID
Click Connect
Open Dashboard
Control devices using switches
See real-time updates via MQTT

🧠 Technologies Used
Flutter 🐦
Dart 💙
MQTT Protocol 📡
mqtt_client package
flutter_riverpod (State Management)

🚀 How to Run Project
1. Install dependencies
flutter pub get
2. Run app
flutter run
📦 Build APK (Optional)
flutter build apk
APK location:
build/app/outputs/flutter-apk/app-release.apk

📊 Evaluation Coverage
✔ Functionality: Device control via MQTT
✔ Real-time updates
✔ Clean architecture (separation of logic & UI)
✔ Proper topic-based communication
✔ State management using Riverpod
