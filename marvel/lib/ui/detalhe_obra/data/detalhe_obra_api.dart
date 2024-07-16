import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class DetalheObraApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(seconds: 40);
  }

  Future<Response<dynamic>> getObraComicDetail(String idComic) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlString("/v1/public/comics/$idComic", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraEventDetail(String idEvent) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlString("/v1/public/events/$idEvent", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraSerieDetail(String idSerie) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlString("/v1/public/series/$idSerie", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getObraStoryDetail(String idStorie) async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlString("/v1/public/stories/$idStorie", params);
    return await get(url).timeout(timeout);
  }
}
