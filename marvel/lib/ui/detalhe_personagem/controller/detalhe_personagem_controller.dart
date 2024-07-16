import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_repository.dart';
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

  @override
  void onInit() async {
    initTabController();
    getArgument();
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
}
