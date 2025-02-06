import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

//checking the current platform device and returning its info

//returning data Model and OS as a string for each platform
//since each platform has different names of device info attributes
checkPlatformAndReturnInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  switch (Platform.operatingSystem) {
    case 'android':
      final fetchedData = await deviceInfo.androidInfo;
      return 'Model: ${fetchedData.brand} ${fetchedData.model}\nAndroid: ${fetchedData.version.release}';
    case 'ios':
      final fetchedData = await deviceInfo.iosInfo;
      return 'Model: ${fetchedData.modelName} ${fetchedData.model}\nOS: ${fetchedData.systemName}';
    case 'windows':
      final fetchedData = await deviceInfo.windowsInfo;
      return 'OS: ${fetchedData.productName}';

    case 'macos':
      final fetchedData = await deviceInfo.macOsInfo;
      return 'Model: ${fetchedData.modelName} ${fetchedData.model}\nOS: ${fetchedData.osRelease}';

    case 'linux':
      final fetchedData = await deviceInfo.linuxInfo;
      return 'OS: ${fetchedData.name}';
  }
}
