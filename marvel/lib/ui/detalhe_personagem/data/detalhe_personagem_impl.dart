import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/listagem_personagens_api.dart';

class DetalhePersonagemRepositoryImpl implements DetalhePersonagemRepository {
  final ListagemPersonagensApi _detalhePersonagemApi;

  DetalhePersonagemRepositoryImpl(this._detalhePersonagemApi);

  Response<dynamic> response = const Response();
}
