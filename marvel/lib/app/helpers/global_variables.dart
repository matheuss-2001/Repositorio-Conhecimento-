import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';

String baseUrlString(String path, [Map<String, dynamic>? queryParameters]) {
  return Uri.https("https://gateway.marvel.com", path, queryParameters)
      .toString();
}

abstract class Auth {
  static String publicKey = "20dda1d0bbb22b7b46a4d982baebc6c5";
  static String privateKey = "3f0d76d1d11a4dc03174096015bbcfe2ffb7edd2";

  static Map<String, String> getCredentials() {
    DateTime currentDateTime = DateTime.now();
    try {
      Get.log("REQUEST: $currentDateTime");

      final String ts = currentDateTime.millisecondsSinceEpoch.toString();
      final Uint8List bytesToHash = utf8.encode('$ts$privateKey$publicKey');
      final Digest md5Digest = md5.convert(bytesToHash);

      return <String, String>{
        "ts": ts,
        "apikey": publicKey,
        "hash": md5Digest.toString().toLowerCase(),
      };
    } catch (e) {
      Get.log("CREDENTIALS ERROR: ${e.toString()}");
      return <String, String>{};
    }
  }
}
