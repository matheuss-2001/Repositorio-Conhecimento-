import 'package:get/get.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';

class HomeMovieController extends GetxController {
  final HomeMovieRepository _homeMovieRepository;
  HomeMovieController(this._homeMovieRepository);

  @override
  void onInit() async {
    initApiHome();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initApiHome() async {}
}
