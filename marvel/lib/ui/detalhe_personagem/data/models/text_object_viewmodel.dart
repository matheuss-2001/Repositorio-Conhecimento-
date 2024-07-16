class TextObjectViewmodel {
  final String type;
  final String language;
  final String text;

  TextObjectViewmodel({
    required this.type,
    required this.language,
    required this.text,
  });

  factory TextObjectViewmodel.fromJson(Map<String, dynamic> json) {
    return TextObjectViewmodel(
      type: json['type'] ?? "",
      language: json['language'] ?? "",
      text: json['text'] ?? "",
    );
  }
}
