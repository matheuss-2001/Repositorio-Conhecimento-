import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_repository.dart';

class DetailMovieController extends GetxController {
  final DetailMovieRepository _detailMovieRepository;
  DetailMovieController(this._detailMovieRepository);

  int idMovie = 0;
  bool loadingDetailMovie = false;

  @override
  void onInit() {
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
    nowPlayingMovie.fold((left) {
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
    }, (resulte) {});
    _gettingDetailMovie(false);
  }

  void _gettingDetailMovie(bool value) {
    loadingDetailMovie = value;
    update();
  }
}
