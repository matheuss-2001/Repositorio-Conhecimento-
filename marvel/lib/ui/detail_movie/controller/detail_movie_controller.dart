import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_repository.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_genre_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_studio_viewmodel.dart';

class DetailMovieController extends GetxController with GetSingleTickerProviderStateMixin {
  final DetailMovieRepository _detailMovieRepository;
  DetailMovieController(this._detailMovieRepository);

  TabController? tabController;
  PageController pageController = PageController();
  int idMovie = 0;
  bool loadingDetailMovie = false;

  List<String> listBackgroundImage = <String>[];

  DetailMovieViewModel detailMovieViewModel = DetailMovieViewModel(
    id: 0,
    movieBackgroundImage: "",
    movieBackgroundImageTwo: "",
    movieTitle: "",
    movieDescription: "",
    movieRate: 0,
    movieBudget: 0,
    movieReleaseDate: "",
    listGenreViewmodel: <MovieGenreViewmodel>[],
    listStudioViewmodel: <MovieStudioViewmodel>[],
  );

  @override
  void onInit() {
    tabController ??= TabController(length: 2, vsync: this);
    _getArgument();
    _getDetailMovie();
    super.onInit();
  }

  void _getArgument() {
    if (Get.arguments != null && Get.arguments["id_movie"] != null) {
      idMovie = Get.arguments["id_movie"];
    }
  }

  Future<void> _getDetailMovie() async {
    _gettingDetailMovie(true);
    final nowPlayingMovie = await _detailMovieRepository.getDetailMovie(idMovie);
    nowPlayingMovie.fold(
      (left) {
        Get.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            child: MarvelDialog(
              title: left.title!,
              bodyText: left.message!,
              buttons: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text("Sair", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        );
      },
      (resulte) {
        detailMovieViewModel = resulte;
        _addBackgroundImageListValue();
      },
    );
    _gettingDetailMovie(false);
  }

  void _gettingDetailMovie(bool value) {
    loadingDetailMovie = value;
    update();
  }

  void _addBackgroundImageListValue() {
    if (detailMovieViewModel.movieBackgroundImage.isNotEmpty) {
      listBackgroundImage.add(detailMovieViewModel.movieBackgroundImage);
    }
    if (detailMovieViewModel.movieBackgroundImageTwo.isNotEmpty) {
      listBackgroundImage.add(detailMovieViewModel.movieBackgroundImageTwo);
    }
  }
}
