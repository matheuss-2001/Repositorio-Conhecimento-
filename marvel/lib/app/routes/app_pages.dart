import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/app/widgets/splash_screen.dart';
import 'package:marvel/ui/detalhe_obra/binding/detalhe_obra_binding.dart';
import 'package:marvel/ui/detalhe_obra/pages/detalhe_obra_page.dart';
import 'package:marvel/ui/detalhe_personagem/binding/detalhe_pesonagem_binding.dart';
import 'package:marvel/ui/detalhe_personagem/page/detalhe_personagem_page.dart';
import 'package:marvel/ui/home_movie/binding/home_movie_binding.dart';
import 'package:marvel/ui/home_movie/page/home_movie_page.dart';
import 'package:marvel/ui/listagem_personagens/binding/listagem_personagens_binding.dart';
import 'package:marvel/ui/listagem_personagens/page/listagem_personagens_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASHSCREEN, page: () => const SplashPage()),
    GetPage(
      fullscreenDialog: true,
      name: Routes.LISTAGEMPERSONAGEMSCREEN,
      page: () => const ListagemPersonagensPage(),
      binding: ListagemPersonagensBinding(),
    ),
    GetPage(
      fullscreenDialog: true,
      name: Routes.DETALHEPERSONAGEMSCREEN,
      page: () => const DetalhePersonagemPage(),
      binding: DetalhePersonagemBinding(),
    ),
    GetPage(
      fullscreenDialog: true,
      name: Routes.DETALHEOBRA,
      page: () => const DetalheObraPage(),
      binding: DetalheObraBinding(),
    ),
    GetPage(
      fullscreenDialog: true,
      name: Routes.HOMEMOVIEPAGE,
      page: () => const HomeMoviePage(),
      binding: HomeMovieBinding(),
    ),
  ];
}
