class MarvelComicViewmodel {
  String resourceURI;
  String name;

  MarvelComicViewmodel({
    required this.resourceURI,
    required this.name,
  });

  factory MarvelComicViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelComicViewmodel(
      resourceURI: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
