import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeviceInfo {
  static const MethodChannel _channel = MethodChannel('marvel.channel');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final Map<dynamic, dynamic> deviceInfo =
          await _channel.invokeMethod('getDeviceInfo');
      return Map<String, dynamic>.from(deviceInfo);
    } on PlatformException catch (e) {
      Get.log('$e');
      return {};
    }
  }
}
