class StoryViewmodel {
  final int available;
  final String collectionURI;
  final List<StoryIndexViewmodel> listaStoryViewmodel;
  final int returned;

  StoryViewmodel(
      {required this.available,
      required this.collectionURI,
      required this.listaStoryViewmodel,
      required this.returned});

  factory StoryViewmodel.fromJson(Map<String, dynamic> json) {
    return StoryViewmodel(
      available: json['available'] ?? 0,
      collectionURI: json['collectionURI'] ?? "",
      listaStoryViewmodel: json['items'] != null
          ? List.from(json['items'])
              .map((e) => StoryIndexViewmodel.fromJson(e))
              .toList()
          : [],
      returned: json['returned'] ?? 0,
    );
  }
}

class StoryIndexViewmodel {
  final String resourceURI;
  final String name;
  final String type;

  StoryIndexViewmodel({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  factory StoryIndexViewmodel.fromJson(Map<String, dynamic> json) {
    return StoryIndexViewmodel(
      resourceURI: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
      type: json['type'] ?? "",
    );
  }
}
