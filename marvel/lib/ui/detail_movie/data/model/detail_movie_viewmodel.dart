import 'package:intl/intl.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_genre_viewmodel.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_studio_viewmodel.dart';

class DetailMovieViewModel {
  int id;
  String movieBackgroundImage;
  String movieBackgroundImageTwo;
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
    required this.movieBackgroundImageTwo,
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
      movieBackgroundImageTwo:
          json['backdrop_path'] != null ? "https://image.tmdb.org/t/p/w780${json['backdrop_path']}" : "",
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

  String getReleaseDateFormated() {
    try {
      DateTime dateTime = DateTime.parse(movieReleaseDate);
      String formattedDate = DateFormat("dd/MM/yyyy").format(dateTime);
      return formattedDate;
    } catch (e) {
      return "";
    }
  }

  String getGenreString() {
    try {
      return listGenreViewmodel.where((e) => e.genreDescription.isNotEmpty).map((e) => e.genreDescription).join(', ');
    } catch (e) {
      return "";
    }
  }

  String getBudgetFormated() {
    try {
      final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
      return formatter.format(movieBudget);
    } catch (e) {
      return "";
    }
  }
}
