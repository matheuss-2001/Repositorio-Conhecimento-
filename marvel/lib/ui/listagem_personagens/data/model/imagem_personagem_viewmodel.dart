class ImagemPersonagemViewmodel {
  String path;
  String extension;

  ImagemPersonagemViewmodel({
    required this.path,
    required this.extension,
  });

  factory ImagemPersonagemViewmodel.fromJson(Map<String, dynamic> json) {
    return ImagemPersonagemViewmodel(
      path: json['path'] ?? "",
      extension: json['extension'] ?? "",
    );
  }

  String get imagemComExtensao => '$path.$extension';
}
