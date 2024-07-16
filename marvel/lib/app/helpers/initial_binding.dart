import 'package:get/get.dart';
import 'package:marvel/app/helpers/check_internet.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetChecker>(() => InternetChecker());
  }
}
