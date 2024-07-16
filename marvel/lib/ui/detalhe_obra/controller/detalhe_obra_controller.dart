import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_repository.dart';

enum ObraType { COMIC, EVENT, SERIE, STORY }

class DetalheObraController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final DetalheObraRepository _detalheObraRepository;

  DetalheObraController(this._detalheObraRepository);

  ObraType obraType = ObraType.COMIC;
  bool gettingPersonagemDetalhe = true;
  String idObra = "";

  late TabController tabController;

  @override
  void onInit() async {
    initTabController();
    getArgument();
    initApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArgument() {
    if (Get.arguments != null &&
        Get.arguments["idObra"] != null &&
        Get.arguments["obraType"] != null) {
      idObra = Get.arguments["idObra"];
      obraType = Get.arguments["obraType"];
    }
  }

  void initApi() {
    switch (obraType) {
      case ObraType.COMIC:
        getObraComicDetail();
      case ObraType.EVENT:
        getObraEventDetail();
      case ObraType.SERIE:
        getObraSerieDetail();
      case ObraType.STORY:
        getObraStoryDetail();
    }
  }

  void initTabController() {
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> getObraComicDetail() async {}

  Future<void> getObraEventDetail() async {}

  Future<void> getObraSerieDetail() async {}

  Future<void> getObraStoryDetail() async {}
}
