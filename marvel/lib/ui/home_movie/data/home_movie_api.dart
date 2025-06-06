import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class HomeMovieApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }

  Future<Response<dynamic>> getNowPLayingMovie(int paginationIndex) async {
    final Map<String, String> params = Auth.getCredentialMovie();
    params.addAll({"page": paginationIndex.toString()});
    final String url = baseUrlMovieString("/3/movie/now_playing", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getPopularMovie(int paginationIndex) async {
    final Map<String, String> params = Auth.getCredentialMovie();
    params.addAll({"page": paginationIndex.toString()});
    final String url = baseUrlMovieString("/3/movie/popular", params);
    return await get(url).timeout(timeout);
  }
}
