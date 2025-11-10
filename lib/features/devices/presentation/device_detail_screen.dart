import 'package:flutter/material.dart';

class DeviceDetailScreen extends StatelessWidget {
  final String deviceId;
  
  const DeviceDetailScreen({required this.deviceId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device: $deviceId')),
      body: Center(child: Text('Device Detail - $deviceId')),
    );
  }
}
