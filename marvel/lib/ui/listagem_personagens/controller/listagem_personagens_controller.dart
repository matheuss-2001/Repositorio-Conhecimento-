import 'package:get/get.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_repository.dart';
import 'package:marvel/ui/listagem_personagens/data/model/index_lista_personagem.dart';

class ListagemPersonagensController extends GetxController {
  final ListagemPersonagensRepository createUserRepository;
  ListagemPersonagensController(this.createUserRepository);

  bool gettingListaPersonagens = true;
  List<IndexListaPersonagem> listaPersonagens = <IndexListaPersonagem>[
    IndexListaPersonagem(id: '01', caracterName: 'javali', caracterUrlPhoto: '',),
    IndexListaPersonagem(id: '02', caracterName: 'javali 2', caracterUrlPhoto: '',),
    IndexListaPersonagem(id: '03', caracterName: 'javali 3', caracterUrlPhoto: '',),
  ];

  //final ScrollController scrollNotifications = ScrollController();
  //final GlobalKey<AnimatedListState> indexAnimatedKey = GlobalKey();



  @override
  void onInit() async{
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
