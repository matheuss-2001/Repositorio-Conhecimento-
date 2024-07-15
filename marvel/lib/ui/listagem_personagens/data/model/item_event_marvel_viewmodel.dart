class EventMarvelItemViewmodel {
  final String resourceURI;
  final String name;

  EventMarvelItemViewmodel({
    required this.resourceURI,
    required this.name,
  });

  factory EventMarvelItemViewmodel.fromJson(Map<String, dynamic> json) {
    return EventMarvelItemViewmodel(
      resourceURI: json['resourceURI'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
