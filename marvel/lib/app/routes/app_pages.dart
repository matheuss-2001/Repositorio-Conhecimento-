import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/app/widgets/splash_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => const SplashPage()),
  ];
}
