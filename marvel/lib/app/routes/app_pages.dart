import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/ui/detail_movie/binding/detail_movie_binding.dart';
import 'package:marvel/ui/detail_movie/page/detail_movie_page.dart';
import 'package:marvel/ui/splash/pages/splash_screen_marvel.dart';
import 'package:marvel/ui/detalhe_obra/binding/detalhe_obra_binding.dart';
import 'package:marvel/ui/detalhe_obra/pages/detalhe_obra_page.dart';
import 'package:marvel/ui/detalhe_personagem/binding/detalhe_pesonagem_binding.dart';
import 'package:marvel/ui/detalhe_personagem/page/detalhe_personagem_page.dart';
import 'package:marvel/ui/home_movie/binding/home_movie_binding.dart';
import 'package:marvel/ui/home_movie/page/home_movie_page.dart';
import 'package:marvel/ui/listagem_personagens/binding/listagem_personagens_binding.dart';
import 'package:marvel/ui/listagem_personagens/page/listagem_personagens_page.dart';
import 'package:marvel/ui/splash/pages/splash_screen_movie.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASHSCREENMARVEL, page: () => const SplashScreenMarvel()),
    GetPage(name: Routes.SPLASHSCREENMOVIE, page: () => const SplashScreenMovie()),
    GetPage(
      fullscreenDialog: true,
      name: Routes.HOMEMOVIEPAGE,
      page: () => const HomeMoviePage(),
      binding: HomeMovieBinding(),
    ),
    GetPage(
      fullscreenDialog: true,
      name: Routes.DETAILMOVIEPAGE,
      page: () => const DetailMoviePage(),
      binding: DetailMovieBinding(),
    ),
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
  ];
}
