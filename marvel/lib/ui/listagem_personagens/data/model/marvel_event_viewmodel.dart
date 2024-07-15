class MarvelEventViewmodel {
  String resourceURI;
  String name;

  MarvelEventViewmodel({
    required this.resourceURI,
    required this.name,
  });

  factory MarvelEventViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelEventViewmodel(
      resourceURI: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
