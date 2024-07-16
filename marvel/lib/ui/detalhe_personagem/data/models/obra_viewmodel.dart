import 'package:marvel/ui/detalhe_personagem/data/models/caracter_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/collection_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/creator_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/date_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/price_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/story_viewmodel.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/text_object_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/imagem_personagem_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_event_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_series_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_url_viewmodel.dart';

class ObraViewmodel {
  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final List<TextObjectViewmodel> listTextObjects;
  final String resourceUri;
  final List<MarvelUrlViewmodel> listUrl;
  final MarvelSeriesViewmodel serieViewmodel;
  final CreatorViewmodel listCreator;
  final CharacterViewmodel listCharacters;
  final StoryViewmodel listStoriesViewmodel;
  final MarvelEventViewmodel eventViewmodel;
  final List<PriceViewmodel> listPriceViewmodel;
  final ImagemPersonagemViewmodel thumbnail;
  final List<ImagemPersonagemViewmodel> images;
  final List<CollectionViewmodel> listVariantViewmodel;
  final List<CollectionViewmodel> listCollectionViewmodel;
  final List<CollectionViewmodel> listCollectedIssuesViewmodel;
  final List<DateViewmodel> listDateViewmodel;

  ObraViewmodel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.listTextObjects,
    required this.resourceUri,
    required this.listUrl,
    required this.serieViewmodel,
    required this.listCreator,
    required this.listCharacters,
    required this.listStoriesViewmodel,
    required this.eventViewmodel,
    required this.listPriceViewmodel,
    required this.thumbnail,
    required this.images,
    required this.listVariantViewmodel,
    required this.listCollectionViewmodel,
    required this.listCollectedIssuesViewmodel,
    required this.listDateViewmodel,
  });

  factory ObraViewmodel.fromJson(Map<String, dynamic> json) {
    return ObraViewmodel(
      id: json['id'] ?? 0,
      digitalId: json['digitalId'] ?? 0,
      title: json['title'] ?? "",
      issueNumber: json['issueNumber'] ?? 0,
      variantDescription: json['variantDescription'] ?? "",
      description: json['description'] ?? "",
      modified: json['modified'] ?? "",
      isbn: json['isbn'] ?? "",
      upc: json['upc'] ?? "",
      diamondCode: json['diamondCode'] ?? "",
      ean: json['ean'] ?? "",
      issn: json['issn'] ?? "",
      format: json['format'] ?? "",
      pageCount: json['pageCount'] ?? 0,
      listTextObjects: json['textObjects'] != null
          ? List.from(json['textObjects'])
              .map((e) => TextObjectViewmodel.fromJson(e))
              .toList()
          : [],
      resourceUri: json['resourceURI'] ?? "",
      listUrl: json['urls'] != null
          ? List.from(json['urls'])
              .map((e) => MarvelUrlViewmodel.fromJson(e))
              .toList()
          : [],
      serieViewmodel: json['series'] != null
          ? MarvelSeriesViewmodel.fromJson(json['series'])
          : MarvelSeriesViewmodel(resourceURI: '', name: ''),
      listCreator: json['creators'] != null
          ? CreatorViewmodel.fromJson(json['creators'])
          : CreatorViewmodel(
              available: 0,
              collectionURI: '',
              listaCreatorIndexViewmodel: [],
              returned: 0,
            ),
      listCharacters: json['characters'] != null
          ? CharacterViewmodel.fromJson(json['characters'])
          : CharacterViewmodel(
              available: 0,
              collectionURI: '',
              listaCharacterViewmodel: [],
              returned: 0,
            ),
      listStoriesViewmodel: json['stories'] != null
          ? StoryViewmodel.fromJson(json['stories'])
          : StoryViewmodel(
              available: 0,
              collectionURI: '',
              listaStoryViewmodel: [],
              returned: 0,
            ),
      eventViewmodel: json['events'] != null
          ? MarvelEventViewmodel.fromJson(json['events'])
          : MarvelEventViewmodel(
              available: 0,
              collectionURI: '',
              listaEventMarvelViewmodel: [],
              returned: 0,
            ),
      listPriceViewmodel: json['prices'] != null
          ? List.from(json['prices'])
              .map((e) => PriceViewmodel.fromJson(e))
              .toList()
          : [],
      thumbnail: json['thumbnail'] != null
          ? ImagemPersonagemViewmodel.fromJson(json['thumbnail'])
          : ImagemPersonagemViewmodel(path: '', extension: ''),
      images: json['images'] != null
          ? List.from(json['images'])
              .map((e) => ImagemPersonagemViewmodel.fromJson(e))
              .toList()
          : [],
      listVariantViewmodel: json['variants'] != null
          ? List.from(json['variants'])
              .map((e) => CollectionViewmodel.fromJson(e))
              .toList()
          : [],
      listCollectionViewmodel: json['collections'] != null
          ? List.from(json['collections'])
              .map((e) => CollectionViewmodel.fromJson(e))
              .toList()
          : [],
      listCollectedIssuesViewmodel: json['collectedIssues'] != null
          ? List.from(json['collectedIssues'])
              .map((e) => CollectionViewmodel.fromJson(e))
              .toList()
          : [],
      listDateViewmodel: json['dates'] != null
          ? List.from(json['dates'])
              .map((e) => DateViewmodel.fromJson(e))
              .toList()
          : [],
    );
  }
}
