import 'package:dartz/dartz.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';

abstract class DetailMovieRepository {
  Future<Either<Failure, DetailMovieViewModel>> getDetailMovie(int movieId);
}
