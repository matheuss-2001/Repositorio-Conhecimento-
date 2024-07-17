import 'package:marvel/ui/listagem_personagens/data/model/imagem_personagem_viewmodel.dart';

class DataPersonagemEvent {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Character> results;

  DataPersonagemEvent({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory DataPersonagemEvent.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List? ?? [];
    List<Character> results =
        resultsList.map((i) => Character.fromJson(i)).toList();

    return DataPersonagemEvent(
      offset: json['offset'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      results: results,
    );
  }
}

class Character {
  final int id;
  final String name;
  final String description;
  final ImagemPersonagemViewmodel thumbnail;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] != null
          ? ImagemPersonagemViewmodel.fromJson(json['thumbnail'])
          : ImagemPersonagemViewmodel(path: '', extension: ''),
    );
  }
}
