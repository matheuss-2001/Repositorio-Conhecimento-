import 'package:get/get.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';
import 'package:marvel/ui/home_movie/data/model/movie_viewmodel.dart';

class HomeMovieController extends GetxController {
  final HomeMovieRepository _homeMovieRepository;
  HomeMovieController(this._homeMovieRepository);

  int currentNowPlayingPaginationIndex = 1;
  int currentPopularPaginationIndex = 1;
  bool loadingNowPlayingMovie = true;
  bool loadingPopularMovie = true;

  List<MovieViewModel> listNowPLayingViewModel = <MovieViewModel>[];
  List<MovieViewModel> listPopularViewModel = <MovieViewModel>[];

  @override
  void onInit() {
    _initApiHome();
    super.onInit();
  }

  Future<void> _initApiHome() async {
    emptyListMovie();
    await _getNowPlayingMovie();
    await _getPopularMovie();
  }

  void emptyListMovie() {
    currentNowPlayingPaginationIndex = 1;
    currentPopularPaginationIndex = 1;
    listNowPLayingViewModel = [];
    listPopularViewModel = [];
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
}
