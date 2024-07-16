import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_data_viewmodel.dart';

class ListagemPersonagensController extends GetxController {
  final ListagemPersonagensRepository _listagemPersonagemRepository;
  ListagemPersonagensController(this._listagemPersonagemRepository);

  bool gettingListaPersonagens = true;

  MarvelDataViewmodel marvelViewmodel = MarvelDataViewmodel(
      offset: 0, limit: 0, total: 0, count: 0, listaPersonagensViewmodel: []);

  @override
  void onInit() async {
    await getMarvelData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getMarvelData() async {
    final documentsWillUse =
        await _listagemPersonagemRepository.getListagemPersonagens();
    documentsWillUse.fold((left) {
      resetMarvelVariable();
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
                      updateListagemPersonagem();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Tentar novamente",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      marvelViewmodel = resulte.marveldDataViewmodel;
    });

    gettingListaPersonagens = false;
    update(["listaPersonagemBuilder"]);
  }

  Future<void> updateListagemPersonagem() async {
    gettingListaPersonagens = true;
    update(["listaPersonagemBuilder"]);
    final documentsWillUse =
        await _listagemPersonagemRepository.getListagemPersonagens();
    documentsWillUse.fold((left) {
      resetMarvelVariable();
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
                      updateListagemPersonagem();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Tentar novamente",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      marvelViewmodel = resulte.marveldDataViewmodel;
    });

    gettingListaPersonagens = false;
    update(["listaPersonagemBuilder"]);
  }

  void resetMarvelVariable() {
    marvelViewmodel = MarvelDataViewmodel(
        offset: 0, limit: 0, total: 0, count: 0, listaPersonagensViewmodel: []);
  }

  void onTapIndexListaCard(int idPersonagem) {
    Get.toNamed(Routes.DETALHEPERSONAGEMSCREEN, arguments: {
      "idPersonagem": idPersonagem.toString(),
    });
  }


}
