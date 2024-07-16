import 'package:marvel/ui/detalhe_personagem/data/models/data_obra_viewmodel.dart';

class ResponseObrasRelacionadasAoPersonagem {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String eTag;
  final DataObraViewmodel data;

  ResponseObrasRelacionadasAoPersonagem({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.eTag,
    required this.data,
  });

  factory ResponseObrasRelacionadasAoPersonagem.fromJson(
      Map<String, dynamic> json) {
    return ResponseObrasRelacionadasAoPersonagem(
      code: json['code'] ?? 0,
      status: json['status'] ?? "",
      copyright: json['copyright'] ?? "",
      attributionText: json['attributionText'] ?? "",
      attributionHtml: json['attributionHTML'] ?? "",
      eTag: json['etag'] ?? "",
      data: json['data'] != null
          ? DataObraViewmodel.fromJson(json['data'])
          : DataObraViewmodel(
              offset: 0, limit: 0, total: 0, count: 0, listaObraViewmodel: []),
    );
  }
}
