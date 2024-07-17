import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_repository.dart';
import 'package:marvel/ui/detalhe_obra/data/detalhe_obra_api.dart';
import 'package:marvel/ui/detalhe_obra/data/models/response_personagens.dart';

class DetalheObraRepositoryImpl implements DetalheObraRepository {
  final DetalheObraApi _detalheObraApi;

  DetalheObraRepositoryImpl(this._detalheObraApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, DataPersonagemEvent>> getObraComicDetail(
      String idComic) async {
    try {
      response = await _detalheObraApi.getObraComicDetail(idComic);

      if (response.statusCode == 200) {
        DataPersonagemEvent result =
            DataPersonagemEvent.fromJson(response.body["data"]);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - personagenes da obra)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, DataPersonagemEvent>> getObraEventDetail(
      String idEvent) async {
    try {
      response = await _detalheObraApi.getObraEventDetail(idEvent);

      if (response.statusCode == 200) {
        DataPersonagemEvent result =
            DataPersonagemEvent.fromJson(response.body["data"]);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - personagenes da obra)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, DataPersonagemEvent>> getObraSerieDetail(
      String idSerie) async {
    try {
      response = await _detalheObraApi.getObraSerieDetail(idSerie);

      if (response.statusCode == 200) {
        DataPersonagemEvent result =
            DataPersonagemEvent.fromJson(response.body["data"]);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - personagenes da obra)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, DataPersonagemEvent>> getObraStoryDetail(
      String idStorie) async {
    try {
      response = await _detalheObraApi.getObraStoryDetail(idStorie);

      if (response.statusCode == 200) {
        DataPersonagemEvent result =
            DataPersonagemEvent.fromJson(response.body["data"]);
        return Right(result);
      }
      return Left(GenericFailure(
          'Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(
          TimeOutError("(${response.statusCode} - personagenes da obra)"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }
}
