import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';

String baseUrlMarvelString(String path, [Map<String, dynamic>? queryParameters]) {
  final Uri uri = Uri.https("gateway.marvel.com", path, queryParameters);
  return uri.toString();
}
String baseUrlMovieString(String path, [Map<String, dynamic>? queryParameters]) {
  final Uri uri = Uri.https("api.themoviedb.org/3/movie", path, queryParameters);
  return uri.toString();
}

abstract class MarvelSepator {
  static const verySmall = SizedBox(height: 4, width: 4);
  static const small = SizedBox(height: 8, width: 8);
  static const medium = SizedBox(height: 16, width: 16);
  static const big = SizedBox(height: 32, width: 32);
}

abstract class Auth {
  static String publicKeyMarvel = "8139bef35741d0afe481ff0fa568b527";
  static String privateKeyMarvel = "9717ad3e4a7e963a8a609fcd8be54e529d5d59d1";

  static String readMovieKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmY0Y2ViYTQ0Yjk0MjQ3YTcxMGYzMzFhOTllNjI3ZCIsIm5iZiI6MTc0OTEzNzkwMC4wNiwic3ViIjoiNjg0MWI5ZWNjMDg5YzBmMDM4YmYxNTNiIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.dep1IXXBv8luKmCPm9ZcP6yf604RQpVF-7atTsuHU2Q";
  static String apiMovieKey = "22f4ceba44b94247a710f331a99e627d";

  static Map<String, String> getCredentials() {
    DateTime currentDateTime = DateTime.now();
    try {
      Get.log("REQUEST: $currentDateTime");

      final String ts = currentDateTime.millisecondsSinceEpoch.toString();
      final Uint8List bytesToHash = utf8.encode('$ts$privateKeyMarvel$publicKeyMarvel');
      final Digest md5Digest = md5.convert(bytesToHash);

      return <String, String>{"ts": ts, "apikey": publicKeyMarvel, "hash": md5Digest.toString().toLowerCase()};
    } catch (e) {
      Get.log("CREDENTIALS ERROR: ${e.toString()}");
      return <String, String>{};
    }
  }
}
