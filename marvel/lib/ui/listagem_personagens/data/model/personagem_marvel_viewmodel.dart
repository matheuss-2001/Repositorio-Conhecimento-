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
  List<MarvelEventViewmodel> events;
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
    //var comicsList = json['comics']['items'] as List;
    //List<MarvelComic> comics = comicsList.map((comic) => MarvelComic.fromJson(comic)).toList();

    //var seriesList = json['series']['items'] as List;
    //List<MarvelSeries> series = seriesList.map((serie) => MarvelSeries.fromJson(serie)).toList();

    //var eventsList = json['events']['items'] as List;
    //List<MarvelEvent> events = eventsList.map((event) => MarvelEvent.fromJson(event)).toList();

    //var urlsList = json['urls'] as List;
    //List<MarvelUrl> urls = urlsList.map((url) => MarvelUrl.fromJson(url)).toList();

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
      events: json['events']['items'] != null
          ? List.from(json['events']['items'])
              .map((e) => MarvelEventViewmodel.fromJson(e))
              .toList()
          : [],
      urls: json['urls'] != null
          ? List.from(json['urls'])
              .map((e) => MarvelUrlViewmodel.fromJson(e))
              .toList()
          : [],
    );
  }
}
