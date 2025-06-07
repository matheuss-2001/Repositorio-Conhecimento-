import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/app/widgets/movie_widget/movie_banner.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_controller.dart';
import 'package:marvel/ui/home_movie/data/model/movie_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class HomeMoviePage extends GetView<HomeMovieController> {
  const HomeMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(toolbarHeight: 70, title: Image.asset(GlobalVariableAssets.logoMovie, height: 32), centerTitle: true);
  }

  RefreshIndicator _buildBody() {
    return RefreshIndicator(
      onRefresh: () => controller.initApiHome(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Em Cartaz', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.5)),
            const SizedBox(height: 16),
            _buildNowPlayingMovie(),
            const SizedBox(height: 16),
            const Text('Popular', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.5)),
            const SizedBox(height: 16),
            _buildPopularMovie(),
            const SizedBox(height: 16),
            _buildFavoriteMovie(),
          ],
        ),
      ),
    );
  }

  GetBuilder _buildNowPlayingMovie() {
    return GetBuilder<HomeMovieController>(
      id: "builderNowPlayingMovie",
      builder: (controller) {
        if (controller.loadingNowPlayingMovie) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1200),
            baseColor: Colors.blue.withOpacity(0.2),
            highlightColor: Colors.black.withOpacity(0.2),
            child: Container(
              height: 180,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
            ),
          );
        }
        return SizedBox(
          height: 180,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            scrollDirection: Axis.horizontal,
            itemCount: controller.listNowPLayingViewModel.length,
            itemBuilder: (context, index) {
              MovieViewModel itemNowPlayingMovie = controller.listNowPLayingViewModel[index];
              return MovieBanner(
                movieTitle: itemNowPlayingMovie.movieTitle,
                movieBackgroundImage: itemNowPlayingMovie.movieBackgroundImage,
                movieRating: itemNowPlayingMovie.movieRate,
                onTapCard: () {
                  controller.onTapMovieBanner(itemNowPlayingMovie);
                },
              );
            },
          ),
        );
      },
    );
  }

  GetBuilder _buildPopularMovie() {
    return GetBuilder<HomeMovieController>(
      id: "builderPopularMovie",
      builder: (controller) {
        if (controller.loadingPopularMovie) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1200),
            baseColor: Colors.blue.withOpacity(0.2),
            highlightColor: Colors.black.withOpacity(0.2),
            child: Container(
              height: 180,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
            ),
          );
        }
        return SizedBox(
          height: 180,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            scrollDirection: Axis.horizontal,
            itemCount: controller.listPopularViewModel.length,
            itemBuilder: (context, index) {
              MovieViewModel itemNowPlayingMovie = controller.listPopularViewModel[index];
              return MovieBanner(
                movieTitle: itemNowPlayingMovie.movieTitle,
                movieBackgroundImage: itemNowPlayingMovie.movieBackgroundImage,
                movieRating: itemNowPlayingMovie.movieRate,
                onTapCard: () {
                  controller.onTapMovieBanner(itemNowPlayingMovie);
                },
              );
            },
          ),
        );
      },
    );
  }

  GetBuilder _buildFavoriteMovie() {
    return GetBuilder<HomeMovieController>(
      id: "builderFavoriteMovie",
      builder: (controller) {
        if (controller.loadingFavoriteMovie) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1200),
            baseColor: Colors.blue.withOpacity(0.2),
            highlightColor: Colors.black.withOpacity(0.2),
            child: Container(
              height: 180,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
            ),
          );
        }
        if (controller.listFavoriteViewModel.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Favoritos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.5)),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFavoriteViewModel.length,
                  itemBuilder: (context, index) {
                    DetailMovieViewModel itemNowPlayingMovie = controller.listFavoriteViewModel[index];
                    return MovieBanner(
                      movieTitle: itemNowPlayingMovie.movieTitle,
                      movieBackgroundImage: itemNowPlayingMovie.movieBackgroundImage,
                      movieRating: itemNowPlayingMovie.movieRate,
                      onTapCard: () {
                        controller.onTapMovieBanner(
                          MovieViewModel(
                            idMovie: itemNowPlayingMovie.id,
                            movieBackgroundImage: itemNowPlayingMovie.movieBackgroundImage,
                            movieTitle: itemNowPlayingMovie.movieTitle,
                            movieRate: itemNowPlayingMovie.movieRate,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
