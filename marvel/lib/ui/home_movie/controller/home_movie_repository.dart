import 'package:dartz/dartz.dart';
import 'package:marvel/app/helpers/either.dart';
import '../data/model/movie_viewmodel.dart';

abstract class HomeMovieRepository {
  Future<Either<Failure, List<MovieViewModel>>> getNowPLayingMovie(int paginationIndex);
  Future<Either<Failure, List<MovieViewModel>>> getPopularMovie(int paginationIndex);
}
