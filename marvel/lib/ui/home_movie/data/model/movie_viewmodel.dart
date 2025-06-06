class MovieViewModel {
  int idMovie;
  String movieBackgroundImage;
  String movieTitle;
  double movieRate;

  MovieViewModel({
    required this.idMovie,
    required this.movieBackgroundImage,
    required this.movieTitle,
    required this.movieRate,
  });

  factory MovieViewModel.fromJson(Map<String, dynamic> json) {
    return MovieViewModel(
      idMovie: json["id"] ?? 0,
      movieBackgroundImage: json['poster_path'] != null ? "https://image.tmdb.org/t/p/w780${json['poster_path']}" : "",
      movieTitle: json["original_title"] ?? "",
      movieRate: json["vote_average"] ?? 0.0,
    );
  }
}
