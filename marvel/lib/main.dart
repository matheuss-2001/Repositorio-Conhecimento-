import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvel/app/helpers/check_internet.dart';
import 'package:marvel/app/helpers/get_device_info.dart';
import 'package:marvel/app/helpers/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

Future<void> fetchDeviceInfo() async {
  final box = GetStorage();
  Map<String, dynamic> deviceInfo = await DeviceInfo.getDeviceInfo();
  box.write('deviceInfo', deviceInfo);
  Get.log("${box.read('deviceInfo')}");
}

Future<void> initInternetChecker() async {
  Get.find<InternetChecker>().init();
}

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  await fetchDeviceInfo();
  await initInternetChecker();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      color: Colors.white,
      title: 'marvel',
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 450),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.SPLASHSCREEN,
    );
  }
}
