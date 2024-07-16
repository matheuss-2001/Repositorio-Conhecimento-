import 'package:marvel/ui/detalhe_personagem/data/models/obra_viewmodel.dart';

class DataObraViewmodel {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<ObraViewmodel> listaObraViewmodel;

  DataObraViewmodel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.listaObraViewmodel,
  });

  factory DataObraViewmodel.fromJson(Map<String, dynamic> json) {
    return DataObraViewmodel(
      offset: json['offset'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      listaObraViewmodel: json['results'] != null
          ? List.from(json['results'])
              .map((e) => ObraViewmodel.fromJson(e))
              .toList()
          : [],
    );
  }
}
