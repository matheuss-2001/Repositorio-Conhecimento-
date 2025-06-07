import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_repository.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_genre_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_studio_viewmodel.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_controller.dart';
import '../../../app/helpers/global_variables.dart';

class DetailMovieController extends GetxController with GetSingleTickerProviderStateMixin {
  final DetailMovieRepository _detailMovieRepository;
  DetailMovieController(this._detailMovieRepository);

  TabController? tabController;
  PageController pageController = PageController();
  int idMovie = 0;
  bool loadingDetailMovie = false;
  bool likedMovie = false;
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
        _checkIfMovieIsLiked();
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

  void _checkIfMovieIsLiked() async {
    List<DetailMovieViewModel> listDetailMovieUserSaved = await getListDetailLikedMovie();
    if (listDetailMovieUserSaved.isNotEmpty) {
      for (int m = 0; m < listDetailMovieUserSaved.length; m++) {
        DetailMovieViewModel movieViewModel = listDetailMovieUserSaved[m];
        if (movieViewModel.id == detailMovieViewModel.id) {
          likedMovie = true;
          return;
        }
      }
    }
  }

  void onTapLikeMovie() async {
    if (!likedMovie) {
      await saveMovieToLocalList();
      _loadApiHome();
      likedMovie = true;
    } else {
      await removeMovieToLocalList();
      _loadApiHome();
      likedMovie = false;
    }
    update();
  }

  Future<void> removeMovieToLocalList() async {
    List<DetailMovieViewModel> listDetailMovieUserSaved = await getListDetailLikedMovie();
    listDetailMovieUserSaved.removeWhere((item) => item.id == detailMovieViewModel.id);
    box.write("list_liked_movie_user", converterListModelToListJson(listDetailMovieUserSaved));
    Get.log("✅ Filme Removido local com sucesso");
  }

  Future<void> saveMovieToLocalList() async {
    List<DetailMovieViewModel> listDetailMovieUserSaved = await getListDetailLikedMovie();
    listDetailMovieUserSaved.add(detailMovieViewModel);
    box.write("list_liked_movie_user", converterListModelToListJson(listDetailMovieUserSaved));
    Get.log("✅ Filme adicionado local com sucesso");
  }

  List<Map<String, dynamic>> converterListModelToListJson(List<DetailMovieViewModel> listDetailMovieUserSaved) {
    return listDetailMovieUserSaved.map((loc) => loc.toJson()).toList();
  }

  Future<List<DetailMovieViewModel>> getListDetailLikedMovie() async {
    List<DetailMovieViewModel> listDetailMovieUserSaved = <DetailMovieViewModel>[];
    List<dynamic>? data = box.read("list_liked_movie_user");
    if (data != null && data.isNotEmpty) {
      listDetailMovieUserSaved = (data).map((item) => DetailMovieViewModel.fromJson(item)).toList();
    }
    return listDetailMovieUserSaved;
  }

  void _loadApiHome() {
    if (Get.isRegistered<HomeMovieController>()) {
      Get.find<HomeMovieController>().initApiHome();
    }
  }
}
