class CharacterViewmodel {
  final int available;
  final String collectionURI;
  final List<CharacterIndexViewmodel> listaCharacterViewmodel;
  final int returned;

  CharacterViewmodel(
      {required this.available,
      required this.collectionURI,
      required this.listaCharacterViewmodel,
      required this.returned});

  factory CharacterViewmodel.fromJson(Map<String, dynamic> json) {
    return CharacterViewmodel(
      available: json['available'] ?? 0,
      collectionURI: json['collectionURI'] ?? "",
      listaCharacterViewmodel: json['items'] != null
          ? List.from(json['items'])
              .map((e) => CharacterIndexViewmodel.fromJson(e))
              .toList()
          : [],
      returned: json['returned'] ?? 0,
    );
  }
}

class CharacterIndexViewmodel {
  final String resourceUri;
  final String name;

  CharacterIndexViewmodel({
    required this.resourceUri,
    required this.name,
  });

  factory CharacterIndexViewmodel.fromJson(Map<String, dynamic> json) {
    return CharacterIndexViewmodel(
      resourceUri: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
