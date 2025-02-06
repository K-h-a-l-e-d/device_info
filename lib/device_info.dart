import 'package:device_os_model/check_platform.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key, required this.title});

  final String title;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  String? deviceInfo;

  Future<void> getDeviceInfo() async {
    //checking the platform of the current device and returns its Name and OS Version
    deviceInfo = await checkPlatformAndReturnInfo();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(deviceInfo ?? 'null'), //displaying Device model and OS
          ],
        ),
      ),
    );
  }
}
