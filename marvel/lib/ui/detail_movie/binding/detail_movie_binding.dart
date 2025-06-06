import 'package:get/get.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_controller.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_repository.dart';
import 'package:marvel/ui/detail_movie/data/detail_movie_api.dart';
import 'package:marvel/ui/detail_movie/data/detail_movie_repository_impl.dart';

class DetailMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailMovieApi());
    Get.lazyPut<DetailMovieRepository>(() => DetailMovieRepositoryImpl(Get.find()));
    Get.lazyPut<DetailMovieController>(() => DetailMovieController(Get.find()));
  }
}
