import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class DetalheObraApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }

  Future<Response<dynamic>> getObraComicDetail(String idComic) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url =
        baseUrlMarvelString("/v1/public/comics/$idComic/characters", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraEventDetail(String idEvent) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url =
        baseUrlMarvelString("/v1/public/events/$idEvent/characters", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraSerieDetail(String idSerie) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url =
        baseUrlMarvelString("/v1/public/series/$idSerie/characters", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraStoryDetail(String idStorie) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url =
        baseUrlMarvelString("/v1/public/stories/$idStorie/characters", params);
    return await get(url).timeout(timeout);
  }
}
