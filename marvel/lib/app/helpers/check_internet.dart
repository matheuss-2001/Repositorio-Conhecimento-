import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InternetChecker extends GetxService {
  RxBool isOnline = false.obs;
  bool isSnackBarOn = false;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectionStream;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    cancelConnectivityStream();
    super.onClose();
  }

  Future<void> init() async {
    isOnline.listen((isOnline) {
      if (!isOnline && !isSnackBarOn) {
        isSnackBarOn = true;
        startTimer();
        Get.snackbar(
          'Sem Conexão',
          'Nenhuma conexão de internet encontrada.',
          backgroundColor: Colors.grey.shade900,
          maxWidth: 450,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
          ),
          duration: const Duration(days: 1),
          isDismissible: false,
          mainButton: TextButton(
              onPressed: () {
                Get.closeCurrentSnackbar();
                isSnackBarOn = false;
              },
              child: const Text('OK')),
          shouldIconPulse: true,
          colorText: Colors.white,
          margin: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
        );
      } else if (isOnline && isSnackBarOn) {
        Get.closeCurrentSnackbar();
        isSnackBarOn = false;
        _timer?.cancel();
        _timer = null;
      }
    });

    isOnline.value = await checkInternet();
    _onConnectivityStream();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = null;

    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) async {
      isOnline.value = await checkInternet();
      if (isOnline.value) {
        timer.cancel();
      }
    });
  }

  void _onConnectivityStream() {
    _connectionStream?.cancel();
    _connectionStream = null;
    _connectionStream =
        _connectivity.onConnectivityChanged.listen((result) async {
      if (!result.contains(ConnectivityResult.none)) {
        isOnline.value = await checkInternet();
      } else {
        isOnline.value = false;
      }
    });
  }

  void cancelConnectivityStream() {
    _connectionStream?.cancel();
    _connectionStream = null;
  }

  static Future<bool> checkInternet() async {
    try {
      http.Response response = await http.get(
          DoHServices.cloudflare.replace(queryParameters: {
            'name': 'google.com',
            'type': 'A',
            'dnssec': '1'
          }),
          headers: {
            'Accept': 'application/dns-json'
          }).timeout(const Duration(milliseconds: 4500));

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}

class DoHServices {
  static final Uri google = Uri.parse('https://dns.google.com/resolve');
  static final Uri cloudflare =
      Uri.parse('https://cloudflare-dns.com/dns-query');
}
