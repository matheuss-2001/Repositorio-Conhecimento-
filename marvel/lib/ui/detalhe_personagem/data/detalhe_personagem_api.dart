import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class DetalhePersonagemApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }

  Future<Response<dynamic>> getDetalhePersonagem(String idPersonagem) async {
    final Map<String, String> params = Auth.getCredentialMarvel();
    final String url =
        baseUrlMarvelString("/v1/public/characters/$idPersonagem", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getComicsPorPersonagem(String idPersonagem) async {
    final Map<String, String> params = Auth.getCredentialMarvel();
    final String url =
        baseUrlMarvelString("/v1/public/characters/$idPersonagem/comics", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getEventPorPersonagem(String idPersonagem) async {
    final Map<String, String> params = Auth.getCredentialMarvel();
    final String url =
        baseUrlMarvelString("/v1/public/characters/$idPersonagem/events", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getSeriesPorPersonagem(String idPersonagem) async {
    final Map<String, String> params = Auth.getCredentialMarvel();
    final String url =
        baseUrlMarvelString("/v1/public/characters/$idPersonagem/series", params);
    return await get(url).timeout(timeout);
  }

  Future<Response<dynamic>> getStoriesPorPersonagem(String idPersonagem) async {
    final Map<String, String> params = Auth.getCredentialMarvel();
    final String url =
        baseUrlMarvelString("/v1/public/characters/$idPersonagem/stories", params);
    return await get(url).timeout(timeout);
  }
}
