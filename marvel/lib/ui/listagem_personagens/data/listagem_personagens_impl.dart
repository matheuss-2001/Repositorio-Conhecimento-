import 'dart:async';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/listagem_personagens_api.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';

class ListagemPersonagensRepositoryImpl
    implements ListagemPersonagensRepository {
  final ListagemPersonagensApi _listagemPersonagemApi;

  ListagemPersonagensRepositoryImpl(this._listagemPersonagemApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, MarvelResponse>> getListagemPersonagens() async {
    try {
      response = await _listagemPersonagemApi.getListagemPersonagens();

      if (response.statusCode == 200) {
        MarvelResponse result = MarvelResponse.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure('Atenção',
          "Algo aconteceu ao buscar marvel data\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar marvel data)"));
    } catch (err) {
      return Left(GenericFailure(null, null));
    }
  }
}
