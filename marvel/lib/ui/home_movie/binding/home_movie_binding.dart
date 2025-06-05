import 'package:get/get.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_controller.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';
import 'package:marvel/ui/home_movie/data/home_movie_api.dart';
import 'package:marvel/ui/home_movie/data/home_movie_repository_impl.dart';

class HomeMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeMovieApi());
    Get.lazyPut<HomeMovieRepository>(() => HomeMovieRepositoryImpl(Get.find()));
    Get.lazyPut<HomeMovieController>(() => HomeMovieController(Get.find()));
  }
}
