import 'package:dartz/dartz.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';
import '../../../app/helpers/either.dart';

abstract class ListagemPersonagensRepository {
  Future<Either<Failure, MarvelResponse>> getListagemPersonagens();
}
