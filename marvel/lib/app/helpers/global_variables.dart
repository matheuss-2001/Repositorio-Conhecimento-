import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';

String baseUrlString(String path, [Map<String, dynamic>? queryParameters]) {
  final Uri uri = Uri.https("gateway.marvel.com", path, queryParameters);
  return uri.toString();
}

abstract class MarvelSepator {
  static const verySmall = SizedBox(height: 4, width: 4);
  static const small = SizedBox(height: 8, width: 8);
  static const medium = SizedBox(height: 16, width: 16);
  static const big = SizedBox(height: 32, width: 32);
}

abstract class Auth {
  static String publicKey = "8139bef35741d0afe481ff0fa568b527";
  static String privateKey = "9717ad3e4a7e963a8a609fcd8be54e529d5d59d1";

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
