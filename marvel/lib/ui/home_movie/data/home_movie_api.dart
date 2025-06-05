import 'package:get/get_connect/connect.dart';

class HomeMovieApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }
}
