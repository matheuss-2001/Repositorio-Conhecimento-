import 'package:get/get.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/model/index_lista_personagem.dart';

class ListagemPersonagensController extends GetxController {
  final ListagemPersonagensRepository createUserRepository;
  ListagemPersonagensController(this.createUserRepository);

  bool gettingListaPersonagens = true;
  List<IndexListaPersonagem> listaPersonagens = <IndexListaPersonagem>[
    IndexListaPersonagem(
      id: '01',
      caracterName: 'javali',
      caracterUrlPhoto:
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
    ),
    IndexListaPersonagem(
      id: '02',
      caracterName: 'javali 2',
      caracterUrlPhoto:
          'https://sm.ign.com/ign_br/screenshot/default/heroi-favorito-br-pesquisa_1gae.jpg',
    ),
    IndexListaPersonagem(
      id: '03',
      caracterName: 'javali 3',
      caracterUrlPhoto:
          'https://i.pinimg.com/736x/b2/7c/4a/b27c4ad38351e60f8866fcdc5f6f984a.jpg',
    ),
    IndexListaPersonagem(
      id: '01',
      caracterName: 'javali',
      caracterUrlPhoto:
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
    ),
    IndexListaPersonagem(
      id: '01',
      caracterName: 'javali',
      caracterUrlPhoto:
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
    ),
    IndexListaPersonagem(
      id: '01',
      caracterName: 'javali',
      caracterUrlPhoto:
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
