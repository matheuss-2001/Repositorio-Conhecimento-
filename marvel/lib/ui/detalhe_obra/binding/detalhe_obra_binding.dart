import 'package:get/get.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_controller.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_repository.dart';
import 'package:marvel/ui/detalhe_obra/data/detalhe_obra_api.dart';
import 'package:marvel/ui/detalhe_obra/data/detalhe_obra_impl.dart';

class DetalheObraBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetalheObraApi());
    Get.lazyPut<DetalheObraRepository>(
        () => DetalheObraRepositoryImpl(Get.find()));
    Get.lazyPut<DetalheObraController>(() => DetalheObraController(Get.find()));
  }
}
