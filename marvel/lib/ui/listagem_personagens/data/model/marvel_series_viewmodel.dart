class MarvelSeriesViewmodel {
  String resourceURI;
  String name;

  MarvelSeriesViewmodel({
    required this.resourceURI,
    required this.name,
  });

  factory MarvelSeriesViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelSeriesViewmodel(
      resourceURI: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
