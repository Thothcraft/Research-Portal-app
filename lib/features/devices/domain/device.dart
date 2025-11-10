import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_name') required String deviceName,
    @JsonKey(name: 'device_type') required String deviceType,
    required bool online,
    @JsonKey(name: 'last_seen') required String lastSeen, @JsonKey(name: 'battery_level') double? batteryLevel,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'mac_address') String? macAddress,
    @JsonKey(name: 'device_uuid') String? deviceUuid,
    @JsonKey(name: 'user_id') int? userId,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
class DeviceListResponse with _$DeviceListResponse {
  const factory DeviceListResponse({
    required List<Device> devices,
  }) = _DeviceListResponse;

  factory DeviceListResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceListResponseFromJson(json);
}

@freezed
class SensorData with _$SensorData {
  const factory SensorData({
    required double temperature,
    required double humidity,
    required double pressure,
    required Orientation orientation,
    required Acceleration acceleration,
    required double compass,
    required String timestamp,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _SensorData;

  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);
}

@freezed
class Orientation with _$Orientation {
  const factory Orientation({
    required double pitch,
    required double roll,
    required double yaw,
  }) = _Orientation;

  factory Orientation.fromJson(Map<String, dynamic> json) =>
      _$OrientationFromJson(json);
}

@freezed
class Acceleration with _$Acceleration {
  const factory Acceleration({
    required double x,
    required double y,
    required double z,
  }) = _Acceleration;

  factory Acceleration.fromJson(Map<String, dynamic> json) =>
      _$AccelerationFromJson(json);
}
