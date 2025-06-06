import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/app/helpers/either.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';
import 'package:marvel/ui/home_movie/data/home_movie_api.dart';
import 'package:marvel/ui/home_movie/data/model/movie_viewmodel.dart';

class HomeMovieRepositoryImpl implements HomeMovieRepository {
  final HomeMovieApi _homeMovieApi;

  HomeMovieRepositoryImpl(this._homeMovieApi);

  Response<dynamic> response = const Response();

  @override
  Future<Either<Failure, List<MovieViewModel>>> getNowPLayingMovie(int paginationIndex) async {
    try {
      response = await _homeMovieApi.getNowPLayingMovie(paginationIndex);

      if (response.statusCode == 200) {
        final listMovieViewModel = List.from(response.body!['results']).map((e) => MovieViewModel.fromJson(e)).toList();
        return Right(listMovieViewModel);
      }
      return Left(GenericFailure('Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(TimeOutError("(${response.statusCode}"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }

  @override
  Future<Either<Failure, List<MovieViewModel>>> getPopularMovie(int paginationIndex) async {
    try {
      response = await _homeMovieApi.getNowPLayingMovie(paginationIndex);

      if (response.statusCode == 200) {
        final listMovieViewModel = List.from(response.body!['results']).map((e) => MovieViewModel.fromJson(e)).toList();
        return Right(listMovieViewModel);
      }
      return Left(GenericFailure('Atenção', "${response.body["message"]}\n(${response.statusCode})"));
    } on TimeoutException catch (_) {
      return Left(TimeOutError("(${response.statusCode}"));
    } catch (err) {
      return Left(GenericFailure("Atenção", "${response.body["message"]}"));
    }
  }
}
