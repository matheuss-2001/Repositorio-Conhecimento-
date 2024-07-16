import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_repository.dart';
import 'package:marvel/ui/detalhe_obra/data/detalhe_obra_api.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';

class DetalheObraRepositoryImpl implements DetalheObraRepository {
  final DetalheObraApi _detalheObraApi;

  DetalheObraRepositoryImpl(this._detalheObraApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, MarvelResponse>> getObraComicDetail(
      String idComic) async {
    try {
      response = await _detalheObraApi.getObraComicDetail(idComic);

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
  Future<Either<Failure, MarvelResponse>> getObraEventDetail(
      String idEvent) async {
    try {
      response = await _detalheObraApi.getObraEventDetail(idEvent);

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
  Future<Either<Failure, MarvelResponse>> getObraSerieDetail(
      String idSerie) async {
    try {
      response = await _detalheObraApi.getObraSerieDetail(idSerie);

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
  Future<Either<Failure, MarvelResponse>> getObraStoryDetail(
      String idStorie) async {
    try {
      response = await _detalheObraApi.getObraStoryDetail(idStorie);

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
}
