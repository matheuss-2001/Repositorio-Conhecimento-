import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/routes/app_routes.dart';
import 'package:marvel/app/widgets/marvel_dialog.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_controller.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_repository.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/obra_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/imagem_personagem_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/marvel_event_viewmodel.dart';
import 'package:marvel/ui/listagem_personagens/data/model/personagem_marvel_viewmodel.dart';

class DetalhePersonagemController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final DetalhePersonagemRepository _detalhePersonagemRepository;
  DetalhePersonagemController(this._detalhePersonagemRepository);

  bool gettingPersonagemDetalhe = true;
  String idPersonagem = "";
  late TabController tabController;

  PersonagemMarvelViewmodel detalhePersongemViewmdel =
      PersonagemMarvelViewmodel(
          id: 0,
          name: '',
          description: '',
          imagemPersonagemViewmodel:
              ImagemPersonagemViewmodel(path: '', extension: ''),
          comics: [],
          series: [],
          events: MarvelEventViewmodel(
              available: 1,
              collectionURI: '',
              listaEventMarvelViewmodel: [],
              returned: 1),
          urls: []);

  List<ObraViewmodel> listaComics = <ObraViewmodel>[];
  List<ObraViewmodel> listaEvent = <ObraViewmodel>[];
  List<ObraViewmodel> listaSeries = <ObraViewmodel>[];
  List<ObraViewmodel> listaStories = <ObraViewmodel>[];

  @override
  void onInit() async {
    initTabController();
    getArgument();
    loadEndpointsDetalhePage();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initTabController() {
    tabController = TabController(length: 4, vsync: this);
  }

  void getArgument() {
    if (Get.arguments != null && Get.arguments["idPersonagem"] != null) {
      idPersonagem = Get.arguments["idPersonagem"];
    }
  }

  Future<void> _getDetalhePersonagem() async {
    final getDetalhePersonagem =
        await _detalhePersonagemRepository.getDetalhePersonagem(idPersonagem);
    getDetalhePersonagem.fold((left) {
      Get.dialog(
          barrierDismissible: false,
          PopScope(
              canPop: false,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Fechar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      if (resulte.marveldDataViewmodel.listaPersonagensViewmodel.isNotEmpty) {
        detalhePersongemViewmdel =
            resulte.marveldDataViewmodel.listaPersonagensViewmodel[0];
      }
    });
  }

  Future<void> _getComicsRelacionadoPersonagem() async {
    final getComic =
        await _detalhePersonagemRepository.getComicsPorPersonagem(idPersonagem);
    getComic.fold((left) {
      Get.dialog(
          barrierDismissible: false,
          PopScope(
              canPop: false,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Fechar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      listaComics = resulte.data.listaObraViewmodel;
    });
  }

  Future<void> _getEventsRelacionadoPersonagem() async {
    final getEvent =
        await _detalhePersonagemRepository.getEventPorPersonagem(idPersonagem);
    getEvent.fold((left) {
      Get.dialog(
          barrierDismissible: false,
          PopScope(
              canPop: false,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Fechar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      listaEvent = resulte.data.listaObraViewmodel;
    });
  }

  Future<void> _getSeriesRelacionadoPersonagem() async {
    final getSeries =
        await _detalhePersonagemRepository.getSeriesPorPersonagem(idPersonagem);
    getSeries.fold((left) {
      Get.dialog(
          barrierDismissible: false,
          PopScope(
              canPop: false,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Fechar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      listaSeries = resulte.data.listaObraViewmodel;
    });
  }

  Future<void> _getStoriesRelacionadoPersonagem() async {
    final getStories = await _detalhePersonagemRepository
        .getStoriesPorPersonagem(idPersonagem);
    getStories.fold((left) {
      Get.dialog(
          barrierDismissible: false,
          PopScope(
              canPop: false,
              child: MarvelDialog(
                title: left.title!,
                bodyText: left.message!,
                buttons: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text(
                      "Fechar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )));
    }, (resulte) {
      listaStories = resulte.data.listaObraViewmodel;
    });
  }

  void loadEndpointsDetalhePage() async {
    await _getDetalhePersonagem();
    await _getComicsRelacionadoPersonagem();
    await _getEventsRelacionadoPersonagem();
    await _getSeriesRelacionadoPersonagem();
    await _getStoriesRelacionadoPersonagem();
    gettingPersonagemDetalhe = false;
    update(["builderDetalhePersonagem"]);
  }

  void onTapCardObra(ObraViewmodel itemObraViewmodel, ObraType obraType) {
    Get.toNamed(Routes.DETALHEOBRA, arguments: {
      "idObra": itemObraViewmodel.id.toString(),
      "obraUrlPhoto": itemObraViewmodel.thumbnail.imagemComExtensao,
      "obraType": obraType
    });
  }
}
