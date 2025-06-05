import 'package:get/get_connect/http/src/response/response.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_repository.dart';
import 'package:marvel/ui/home_movie/data/home_movie_api.dart';

class HomeMovieRepositoryImpl implements HomeMovieRepository {
  final HomeMovieApi _homeMovieApi;

  HomeMovieRepositoryImpl(this._homeMovieApi);

  Response<dynamic> response = const Response();
}
