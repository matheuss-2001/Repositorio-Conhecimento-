class MovieStudioViewmodel {
  int id;
  String studioNme;
  String studioBackgroundImage;
  String studioCountry;

  MovieStudioViewmodel({
    required this.id,
    required this.studioNme,
    required this.studioBackgroundImage,
    required this.studioCountry,
  });

  factory MovieStudioViewmodel.fromJson(Map<String, dynamic> json) {
    return MovieStudioViewmodel(
      id: json["id"] ?? 0,
      studioNme: json['name'] ?? "",
      studioBackgroundImage: json['logo_path'] != null ? "https://image.tmdb.org/t/p/w780${json['logo_path']}" : "",
      studioCountry: json["origin_country"] ?? "",
    );
  }
}
