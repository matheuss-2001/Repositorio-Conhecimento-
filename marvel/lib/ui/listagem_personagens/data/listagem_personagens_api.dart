import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class ListagemPersonagensApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(minutes: 2);
  }

  Future<Response<dynamic>> getListagemPersonagens() async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlMarvelString("/v1/public/characters", params);
    return await get(url).timeout(timeout);
  }
}
