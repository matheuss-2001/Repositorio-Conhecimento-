import 'package:get/get.dart';
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
    }, (resulte) async {
      marvelViewmodel = resulte.marveldDataViewmodel;
    });

    gettingListaPersonagens = false;
    update(["listaPersonagemBuilder"]);
  }
}
