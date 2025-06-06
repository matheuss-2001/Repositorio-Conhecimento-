import 'package:marvel/ui/detail_movie/data/model/movie_genre_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_studio_viewmodel.dart';

class DetailMovieViewModel {
  int id;
  String movieBackgroundImage;
  String movieTitle;
  String movieDescription;
  double movieRate;
  int movieBudget;
  String movieReleaseDate;
  List<MovieGenreViewmodel> listGenreViewmodel;
  List<MovieStudioViewmodel> listStudioViewmodel;

  DetailMovieViewModel({
    required this.id,
    required this.movieBackgroundImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.movieRate,
    required this.movieBudget,
    required this.movieReleaseDate,
    required this.listGenreViewmodel,
    required this.listStudioViewmodel,
  });

  factory DetailMovieViewModel.fromJson(Map<String, dynamic> json) {
    return DetailMovieViewModel(
      id: json["id"] ?? 0,
      movieBackgroundImage: json['poster_path'] != null ? "https://image.tmdb.org/t/p/w780${json['poster_path']}" : "",
      movieTitle: json["original_title"] ?? "",
      movieDescription: json["overview"] ?? "",
      movieRate: json["vote_average"] ?? 0.0,
      movieBudget: json["budget"] ?? 0,
      movieReleaseDate: json["release_date"] ?? "",
      listGenreViewmodel:
          json['genres'] != null
              ? (json['genres'] as List).map((serviceJson) => MovieGenreViewmodel.fromJson(serviceJson)).toList()
              : <MovieGenreViewmodel>[],
      listStudioViewmodel:
          json['production_companies'] != null
              ? (json['production_companies'] as List)
                  .map((serviceJson) => MovieStudioViewmodel.fromJson(serviceJson))
                  .toList()
              : <MovieStudioViewmodel>[],
    );
  }
}
