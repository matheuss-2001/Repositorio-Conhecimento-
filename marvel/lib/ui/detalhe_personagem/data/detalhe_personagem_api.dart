import 'package:get/get_connect/connect.dart';

class DetalhePersonagemApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(seconds: 40);
  }
}
