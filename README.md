
# 🏠 Smart Home Controller (Flutter + MQTT)

## 📌 Project Overview

This is a Flutter-based Smart Home Controller app that uses MQTT protocol to control and monitor smart devices like Light, Fan, and AC in real-time.

---

## ⚙️ Features

* MQTT Connection (Broker + Client ID)
* Light ON/OFF control 💡
* Fan ON/OFF control 🌬️
* AC ON/OFF control ❄️
* Real-time device state updates
* MQTT publish/subscribe communication

---

## 🧩 Project Structure

```
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
```

---

## 🌐 MQTT Configuration

**Broker:**
test.mosquitto.org

**Port:**
1883

---

## 📡 MQTT Topics

* home/light → ON / OFF
* home/fan → ON / OFF
* home/ac → ON / OFF

---

## 🧪 How to Test

### 1. Open MQTTX

Connect to broker:

```
test.mosquitto.org
Port: 1883
```

### 2. Subscribe Topics

```
home/light
home/fan
home/ac
```

### 3. Test Publishing

Send messages:

```
ON
OFF
```

Example:

* Publish ON → Device turns ON in app
* Publish OFF → Device turns OFF in app

---

## 📱 App Flow

1. Open app
2. Enter broker URL + Client ID
3. Click Connect
4. Open Dashboard
5. Control devices using switches
6. See real-time updates

---

## 🧠 Technologies Used

* Flutter
* Dart
* MQTT Protocol
* mqtt_client package
* Riverpod (State Management)

---

## 🚀 Run Project

```bash
flutter pub get
flutter run
```

---

## 📦 Build APK

```bash
flutter build apk
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 👨‍💻 Note

This project demonstrates real-time IoT communication using MQTT protocol with Flutter mobile application.

---

