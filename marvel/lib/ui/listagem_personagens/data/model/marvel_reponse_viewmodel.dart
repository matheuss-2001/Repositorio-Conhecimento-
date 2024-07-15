import 'package:marvel/ui/listagem_personagens/data/model/marvel_data_viewmodel.dart';

class MarvelResponse {
  int statusCode;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String eTag;
  MarvelDataViewmodel marveldDataViewmodel;

  MarvelResponse({
    required this.statusCode,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.eTag,
    required this.marveldDataViewmodel,
  });

  factory MarvelResponse.fromJson(Map<String, dynamic> json) {
    return MarvelResponse(
      statusCode: json['code'] ?? 0,
      status: json['status'] ?? "",
      copyright: json['copyright'] ?? "",
      attributionText: json['attributionText'] ?? "",
      attributionHTML: json['attributionHTML'] ?? "",
      eTag: json['etag'] ?? "",
      marveldDataViewmodel: json['data'] != null
          ? MarvelDataViewmodel.fromJson(json['data'])
          : MarvelDataViewmodel(
              offset: 0,
              limit: 0,
              total: 0,
              count: 0,
              listaPersonagensViewmodel: [],
            ),
    );
  }
}
