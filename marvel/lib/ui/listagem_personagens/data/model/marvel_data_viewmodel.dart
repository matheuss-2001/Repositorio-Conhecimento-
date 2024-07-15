import 'package:marvel/ui/listagem_personagens/data/model/personagem_marvel_viewmodel.dart';

class MarvelDataViewmodel {
  int offset;
  int limit;
  int total;
  int count;
  List<PersonagemMarvelViewmodel> listaPersonagensViewmodel;

  MarvelDataViewmodel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.listaPersonagensViewmodel,
  });

  factory MarvelDataViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelDataViewmodel(
      offset: json['offset'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      listaPersonagensViewmodel: json['results'] != null
          ? List.from(json['results'])
              .map((e) => PersonagemMarvelViewmodel.fromJson(e))
              .toList()
          : [],
    );
  }
}
