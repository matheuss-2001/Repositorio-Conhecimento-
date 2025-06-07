import 'package:get/get.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';
import 'package:marvel/ui/home_movie/data/model/movie_viewmodel.dart';

import '../../../app/helpers/global_variables.dart';

class HomeMovieController extends GetxController {
  final HomeMovieRepository _homeMovieRepository;
  HomeMovieController(this._homeMovieRepository);

  int currentNowPlayingPaginationIndex = 1;
  int currentPopularPaginationIndex = 1;

  bool loadingNowPlayingMovie = true;
  bool loadingPopularMovie = true;
  bool loadingFavoriteMovie = true;

  List<MovieViewModel> listNowPLayingViewModel = <MovieViewModel>[];
  List<MovieViewModel> listPopularViewModel = <MovieViewModel>[];
  List<DetailMovieViewModel> listFavoriteViewModel = <DetailMovieViewModel>[];

  @override
  void onInit() {
    initApiHome();
    super.onInit();
  }

  Future<void> initApiHome() async {
    emptyListMovie();
    await _getNowPlayingMovie();
    await _getPopularMovie();
    await _getFavoriteUserMovie();
  }

  void emptyListMovie() {
    currentNowPlayingPaginationIndex = 1;
    currentPopularPaginationIndex = 1;
    listNowPLayingViewModel = [];
    listPopularViewModel = [];
    listFavoriteViewModel = [];
  }

  Future<void> _getNowPlayingMovie() async {
    _gettingNowPlayingMovie(true);
    final nowPlayingMovie = await _homeMovieRepository.getNowPLayingMovie(currentNowPlayingPaginationIndex);
    nowPlayingMovie.fold((left) {}, (resulte) {
      listNowPLayingViewModel = resulte;
    });
    _gettingNowPlayingMovie(false);
  }

  void _gettingNowPlayingMovie(bool value) {
    loadingNowPlayingMovie = value;
    update(["builderNowPlayingMovie"]);
  }

  Future<void> _getPopularMovie() async {
    _gettingPopularMovie(true);
    final nowPlayingMovie = await _homeMovieRepository.getPopularMovie(currentPopularPaginationIndex);
    nowPlayingMovie.fold((left) {}, (resulte) {
      listPopularViewModel = resulte;
    });
    _gettingPopularMovie(false);
  }

  void _gettingPopularMovie(bool value) {
    loadingPopularMovie = value;
    update(["builderPopularMovie"]);
  }

  void onTapMovieBanner(MovieViewModel itemNowPlayingMovie) {
    Get.toNamed(Routes.DETAILMOVIEPAGE, arguments: {"id_movie": itemNowPlayingMovie.idMovie});
  }

  Future<void> _getFavoriteUserMovie() async {
    _gettingFavoriteMovie(true);
    List<dynamic>? data = box.read("list_liked_movie_user");
    if (data != null && data.isNotEmpty) {
      listFavoriteViewModel = (data).map((item) => DetailMovieViewModel.fromJson(item)).toList();
    }
    _gettingFavoriteMovie(false);
  }

  void _gettingFavoriteMovie(bool value) {
    loadingFavoriteMovie = value;
    update(["builderFavoriteMovie"]);
  }
}
