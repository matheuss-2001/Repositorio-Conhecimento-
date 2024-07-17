import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_repository.dart';
import 'package:marvel/ui/detalhe_obra/data/models/response_personagens.dart';

enum ObraType { COMIC, EVENT, SERIE, STORY }

class DetalheObraController extends GetxController {
  final DetalheObraRepository _detalheObraRepository;

  DetalheObraController(this._detalheObraRepository);

  ObraType obraType = ObraType.COMIC;
  bool gettingObraDetalhe = true;

  String idObra = "";
  String urlPhoto = "";

  late TabController tabController;

  DataPersonagemEvent dataPersonagemEvent =
      DataPersonagemEvent(offset: 0, limit: 0, total: 0, count: 0, results: []);

  @override
  void onInit() async {
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
        Get.arguments["obraType"] != null &&
        Get.arguments["obraUrlPhoto"] != null) {
      idObra = Get.arguments["idObra"];
      obraType = Get.arguments["obraType"];
      urlPhoto = Get.arguments["obraUrlPhoto"];
    }
  }

  void initApi() async {
    switch (obraType) {
      case ObraType.COMIC:
        await getObraComicDetail();
      case ObraType.EVENT:
        await getObraEventDetail();
      case ObraType.SERIE:
        await getObraSerieDetail();
      case ObraType.STORY:
        await getObraStoryDetail();
    }
    gettingObraDetalhe = false;
    update(["builderDetalheObra"]);
  }

  Future<void> getObraComicDetail() async {
    final obraDetail = await _detalheObraRepository.getObraComicDetail(idObra);
    obraDetail.fold((left) {
      Get.dialog(
          barrierDismissible: true,
          PopScope(
              canPop: true,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      dataPersonagemEvent = resulte;
    });
  }

  Future<void> getObraEventDetail() async {
    final obraDetail = await _detalheObraRepository.getObraEventDetail(idObra);
    obraDetail.fold((left) {
      Get.dialog(
          barrierDismissible: true,
          PopScope(
              canPop: true,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      dataPersonagemEvent = resulte;
    });
  }

  Future<void> getObraSerieDetail() async {
    final obraDetail = await _detalheObraRepository.getObraSerieDetail(idObra);
    obraDetail.fold((left) {
      Get.dialog(
          barrierDismissible: true,
          PopScope(
              canPop: true,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      dataPersonagemEvent = resulte;
    });
  }

  Future<void> getObraStoryDetail() async {
    final obraDetail = await _detalheObraRepository.getObraStoryDetail(idObra);
    obraDetail.fold((left) {
      Get.dialog(
          barrierDismissible: true,
          PopScope(
              canPop: true,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      dataPersonagemEvent = resulte;
    });
  }
}
