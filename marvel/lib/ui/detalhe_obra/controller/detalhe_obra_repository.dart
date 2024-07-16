import 'package:dartz/dartz.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';

abstract class DetalheObraRepository {
  Future<Either<Failure, MarvelResponse>> getObraComicDetail(String idComic);
  Future<Either<Failure, MarvelResponse>> getObraEventDetail(String idEvent);
  Future<Either<Failure, MarvelResponse>> getObraSerieDetail(String idSerie);
  Future<Either<Failure, MarvelResponse>> getObraStoryDetail(String idStorie);
}
