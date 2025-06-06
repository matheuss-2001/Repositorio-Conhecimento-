import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class DetailMovieApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }

  Future<Response<dynamic>> getDetailMovie(int movieId) async {
    final Map<String, String> params = Auth.getCredentialMovie();
    final String url = baseUrlMovieString("/3/movie/$movieId", params);
    return await get(url).timeout(timeout);
  }
}
