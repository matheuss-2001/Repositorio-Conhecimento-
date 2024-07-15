import 'package:marvel/ui/listagem_personagens/data/model/imagem_personagem_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_comic_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_event_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_series_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_url_viewmodel.dart';

class PersonagemMarvelViewmodel {
  int id;
  String name;
  String description;
  ImagemPersonagemViewmodel imagemPersonagemViewmodel;
  List<MarvelComicViewmodel> comics;
  List<MarvelSeriesViewmodel> series;
  MarvelEventViewmodel events;
  List<MarvelUrlViewmodel> urls;

  PersonagemMarvelViewmodel({
    required this.id,
    required this.name,
    required this.description,
    required this.imagemPersonagemViewmodel,
    required this.comics,
    required this.series,
    required this.events,
    required this.urls,
  });

  factory PersonagemMarvelViewmodel.fromJson(Map<String, dynamic> json) {
    return PersonagemMarvelViewmodel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      imagemPersonagemViewmodel:
          ImagemPersonagemViewmodel.fromJson(json['thumbnail']),
      comics: json['comics']['items'] != null
          ? List.from(json['comics']['items'])
              .map((e) => MarvelComicViewmodel.fromJson(e))
              .toList()
          : [],
      series: json['series']['items'] != null
          ? List.from(json['series']['items'])
              .map((e) => MarvelSeriesViewmodel.fromJson(e))
              .toList()
          : [],
      events: json['events'] != null
          ? MarvelEventViewmodel.fromJson(json['events'])
          : MarvelEventViewmodel(
              available: 0,
              collectionURI: '',
              listaEventMarvelViewmodel: [],
              returned: 0,
            ),
      urls: json['urls'] != null
          ? List.from(json['urls'])
              .map((e) => MarvelUrlViewmodel.fromJson(e))
              .toList()
          : [],
    );
  }
}
