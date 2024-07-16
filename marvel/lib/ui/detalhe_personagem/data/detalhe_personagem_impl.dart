import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_repository.dart';
import 'package:marvel/ui/detalhe_personagem/data/detalhe_personagem_api.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/respose_obra_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';

class DetalhePersonagemRepositoryImpl implements DetalhePersonagemRepository {
  final DetalhePersonagemApi _detalhePersonagemApi;

  DetalhePersonagemRepositoryImpl(this._detalhePersonagemApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, MarvelResponse>> getDetalhePersonagem(
      String idPersonagem) async {
    try {
      response = await _detalhePersonagemApi.getDetalhePersonagem(idPersonagem);

      if (response.statusCode == 200) {
        MarvelResponse result = MarvelResponse.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar marvel data)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getComicsPorPersonagem(String idPersonagem) async {
    try {
      response =
          await _detalhePersonagemApi.getComicsPorPersonagem(idPersonagem);

      if (response.statusCode == 200) {
        ResponseObrasRelacionadasAoPersonagem result =
            ResponseObrasRelacionadasAoPersonagem.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar obras relacionadas)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getEventPorPersonagem(String idPersonagem) async {
    try {
      response =
          await _detalhePersonagemApi.getEventPorPersonagem(idPersonagem);

      if (response.statusCode == 200) {
        ResponseObrasRelacionadasAoPersonagem result =
            ResponseObrasRelacionadasAoPersonagem.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar obras relacionadas)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getSeriesPorPersonagem(String idPersonagem) async {
    try {
      response =
          await _detalhePersonagemApi.getSeriesPorPersonagem(idPersonagem);

      if (response.statusCode == 200) {
        ResponseObrasRelacionadasAoPersonagem result =
            ResponseObrasRelacionadasAoPersonagem.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar obras relacionadas)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getStoriesPorPersonagem(String idPersonagem) async {
    try {
      response =
          await _detalhePersonagemApi.getStoriesPorPersonagem(idPersonagem);

      if (response.statusCode == 200) {
        ResponseObrasRelacionadasAoPersonagem result =
            ResponseObrasRelacionadasAoPersonagem.fromJson(response.body);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - buscar obras relacionadas)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }
}
