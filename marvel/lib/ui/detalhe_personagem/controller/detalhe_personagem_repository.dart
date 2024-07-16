import 'package:dartz/dartz.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/respose_obra_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_reponse_viewmodel.dart';

abstract class DetalhePersonagemRepository {
  Future<Either<Failure, MarvelResponse>> getDetalhePersonagem(
      String idPersonagem);
  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getComicsPorPersonagem(String idPersonagem);

  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getEventPorPersonagem(String idPersonagem);

  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getSeriesPorPersonagem(String idPersonagem);

  Future<Either<Failure, ResponseObrasRelacionadasAoPersonagem>>
      getStoriesPorPersonagem(String idPersonagem);
}
