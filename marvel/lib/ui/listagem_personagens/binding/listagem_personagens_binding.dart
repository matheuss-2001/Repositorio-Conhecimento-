import 'package:get/get.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_controller.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/listagem_personagens_api.dart';
import 'package:marvel/ui/listagem_personagens/data/listagem_personagens_impl.dart';

class ListagemPersonagensBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListagemPersonagensApi());
    Get.lazyPut<ListagemPersonagensRepository>(() => ListagemPersonagensRepositoryImpl(Get.find()));
    Get.lazyPut<ListagemPersonagensController>(() => ListagemPersonagensController(Get.find()));
  }
}
