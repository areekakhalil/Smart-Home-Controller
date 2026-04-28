class DeviceModel {
  String name;
  String topic;
  bool status;

  DeviceModel({
    required this.name,
    required this.topic,
    this.status = false,
  });
}
