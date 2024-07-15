class MarvelUrlViewmodel {
  String type;
  String url;

  MarvelUrlViewmodel({
    required this.type,
    required this.url,
  });

  factory MarvelUrlViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelUrlViewmodel(
      type: json['type'] ?? "",
      url: json['url'] ?? "",
    );
  }
}
