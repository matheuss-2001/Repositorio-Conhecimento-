import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/app/widgets/splash_screen.dart';
import 'package:marvel/ui/listagem_personagens/binding/listagem_personagens_binding.dart';
import 'package:marvel/ui/listagem_personagens/page/listagem_personagens_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASHSCREEN, page: () => const SplashPage()),
    GetPage(
        fullscreenDialog: true,
        name: Routes.LISTAGEMPERSONAGEMSCREEN,
        page: () => const ListagemPersonagensPage(),
        binding: ListagemPersonagensBinding()),
  ];
}
