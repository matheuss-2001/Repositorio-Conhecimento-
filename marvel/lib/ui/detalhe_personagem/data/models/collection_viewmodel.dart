class CollectionViewmodel {
  final String resourceUri;
  final String name;

  CollectionViewmodel({
    required this.resourceUri,
    required this.name,
  });

  factory CollectionViewmodel.fromJson(Map<String, dynamic> json) {
    return CollectionViewmodel(
      resourceUri: json['resourceURI']??"",
      name: json['name']??"",
    );
  }
}