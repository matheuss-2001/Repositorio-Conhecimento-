class CreatorViewmodel {
  final int available;
  final String collectionURI;
  final List<CreatorIndexViewmodel> listaCreatorIndexViewmodel;
  final int returned;

  CreatorViewmodel(
      {required this.available,
      required this.collectionURI,
      required this.listaCreatorIndexViewmodel,
      required this.returned});

  factory CreatorViewmodel.fromJson(Map<String, dynamic> json) {
    return CreatorViewmodel(
      available: json['available'] ?? 0,
      collectionURI: json['collectionURI'] ?? "",
      listaCreatorIndexViewmodel: json['items'] != null
          ? List.from(json['items'])
              .map((e) => CreatorIndexViewmodel.fromJson(e))
              .toList()
          : [],
      returned: json['returned'] ?? 0,
    );
  }
}

class CreatorIndexViewmodel {
  final String resourceUri;
  final String name;
  final String role;

  CreatorIndexViewmodel({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorIndexViewmodel.fromJson(Map<String, dynamic> json) {
    return CreatorIndexViewmodel(
      resourceUri: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
      role: json['role'] ?? "",
    );
  }
}
