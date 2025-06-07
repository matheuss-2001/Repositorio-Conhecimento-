class MovieGenreViewmodel {
  int id;
  String genreDescription;

  MovieGenreViewmodel({required this.id, required this.genreDescription});

  factory MovieGenreViewmodel.fromJson(Map<String, dynamic> json) {
    return MovieGenreViewmodel(id: json["id"] ?? 0, genreDescription: json['name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": genreDescription};
  }
}
