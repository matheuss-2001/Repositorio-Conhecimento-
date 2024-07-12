import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/listagem_personagens_api.dart';

class ListagemPersonagensRepositoryImpl
    implements ListagemPersonagensRepository {
  final ListagemPersonagensApi _listagemPersonagemApi;

  ListagemPersonagensRepositoryImpl(this._listagemPersonagemApi);
}
