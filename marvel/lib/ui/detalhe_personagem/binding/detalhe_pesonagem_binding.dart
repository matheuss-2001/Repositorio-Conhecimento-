import 'package:get/get.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_controller.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_repository.dart';
import 'package:marvel/ui/detalhe_personagem/data/detalhe_personagem_api.dart';
import 'package:marvel/ui/detalhe_personagem/data/detalhe_personagem_impl.dart';

class DetalhePersonagemBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetalhePersonagemApi());
    Get.lazyPut<DetalhePersonagemRepository>(() => DetalhePersonagemRepositoryImpl(Get.find()));
    Get.lazyPut<DetalhePersonagemController>(() => DetalhePersonagemController(Get.find()));
  }
}
