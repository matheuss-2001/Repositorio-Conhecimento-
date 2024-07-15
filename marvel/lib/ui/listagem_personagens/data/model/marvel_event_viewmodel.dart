import 'package:marvel/ui/listagem_personagens/data/model/item_event_marvel_viewmodel.dart';

class MarvelEventViewmodel {
  final int available;
  final String collectionURI;
  final List<EventMarvelItemViewmodel> listaEventMarvelViewmodel;
  final int returned;

  MarvelEventViewmodel(
      {required this.available,
      required this.collectionURI,
      required this.listaEventMarvelViewmodel,
      required this.returned});

  factory MarvelEventViewmodel.fromJson(Map<String, dynamic> json) {
    return MarvelEventViewmodel(
      available: json['available'] ?? 0,
      collectionURI: json['collectionURI'] ?? "",
      listaEventMarvelViewmodel: json['items'] != null
          ? List.from(json['items'])
              .map((e) => EventMarvelItemViewmodel.fromJson(e))
              .toList()
          : [],
      returned: json['returned'] ?? 0,
    );
  }
}
