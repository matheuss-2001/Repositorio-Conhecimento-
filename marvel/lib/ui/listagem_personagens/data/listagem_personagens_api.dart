import 'package:get/get_connect/connect.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class ListagemPersonagensApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    timeout = const Duration(seconds: 40);
  }

  Future<Response<dynamic>> getListagemPersonagens() async {
    final Map<String, String> params = Auth.getCredentials();
    final String url = baseUrlString("/v1/public/characters", params);
    return await get(url,
            headers: {'Authorization': 'Bearer ${Auth.publicKey}'})
        .timeout(timeout);
  }
}
