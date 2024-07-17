import 'package:dartz/dartz.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detalhe_obra/data/models/response_personagens.dart';

abstract class DetalheObraRepository {
  Future<Either<Failure, DataPersonagemEvent>> getObraComicDetail(
      String idComic);
  Future<Either<Failure, DataPersonagemEvent>> getObraEventDetail(
      String idEvent);
  Future<Either<Failure, DataPersonagemEvent>> getObraSerieDetail(
      String idSerie);
  Future<Either<Failure, DataPersonagemEvent>> getObraStoryDetail(
      String idStorie);
}
