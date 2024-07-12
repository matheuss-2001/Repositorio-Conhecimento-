import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/card_index_lista_personagem.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_controller.dart';
import 'package:marvel/ui/listagem_personagens/data/model/index_lista_personagem.dart';

class ListagemPersonagensPage extends GetView<ListagemPersonagensController> {
  const ListagemPersonagensPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context, size),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Personagens"),
    );
  }

  GetBuilder _buildBody(BuildContext context, Size size) {
    return GetBuilder<ListagemPersonagensController>(
      builder: (controller) {
        if (!controller.gettingListaPersonagens) {
          return Container();
          /*
            ListView.separated(
            itemCount: 15,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    const SizedBox(
                      height: 20,
                    ),
                  Container(
                    margin: responsiveMargin(size),
                    child: Shimmer.fromColors(
                      period: const Duration(milliseconds: 1200),
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.black.withOpacity(0.5),
                      child: const ShimmerChooseItem(
                          typeOfLoagings: TypeOfLoading.myPolicesShimmer),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          );

           */
        }
        return _listaPersonagem();
      },
    );
  }

  Widget _listaPersonagem() {
    if (controller.listaPersonagens.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () async {}, //=> controller.getNotifications(false),
        child: AnimatedList(
          //key: controller.keyOfListActiveSolicitation,
          //controller: controller.scrollNotifications,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(16),
          initialItemCount: controller.listaPersonagens.length,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            IndexListaPersonagem itemPersonagemIndex = controller.listaPersonagens[index];
            return CardIndexListaPersonagem(
                id: itemPersonagemIndex.id,
                personagemName: itemPersonagemIndex.caracterName,
                personagemUrl: itemPersonagemIndex.caracterUrlPhoto,
                onDelete: () {});
          },
        ),
      );
    }

    return const Center(
      child: Text('Não há notificação',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }
}
