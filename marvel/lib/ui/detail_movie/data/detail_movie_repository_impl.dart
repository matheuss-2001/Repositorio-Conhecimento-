import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_repository.dart';
import 'package:marvel/ui/detail_movie/data/detail_movie_api.dart';
import 'package:marvel/ui/detail_movie/data/model/detail_movie_viewmodel.dart';

class DetailMovieRepositoryImpl implements DetailMovieRepository {
  final DetailMovieApi _detailMovieApi;

  DetailMovieRepositoryImpl(this._detailMovieApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, DetailMovieViewModel>> getDetailMovie(int movieId) async {
    try {
      response = await _detailMovieApi.getDetailMovie(movieId);
      if (response.statusCode == 200) {
        final DetailMovieViewModel detailMovieViewModel = DetailMovieViewModel.fromJson(response.body);
        return Right(detailMovieViewModel);
      }
      return Left(GenericFailure('Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(TimeOutError("(${response.statusCode}"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }
}
