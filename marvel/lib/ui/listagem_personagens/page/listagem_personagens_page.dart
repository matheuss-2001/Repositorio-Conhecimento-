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
        }
        return _personagemWidget();
      },
    );
  }

  Widget _personagemWidget() {
    if (controller.listaPersonagens.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () async {}, //=> controller.getNotifications(false),
        child: AnimatedList(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(16),
          initialItemCount: controller.listaPersonagens.length,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            IndexListaPersonagem itemPersonagemIndex =
                controller.listaPersonagens[index];
            return CardIndexListaPersonagem(
              id: ValueKey<String>(itemPersonagemIndex.id),
              personagemName: itemPersonagemIndex.caracterName,
              personagemUrl: itemPersonagemIndex.caracterUrlPhoto,
              onDelete: () {},
              onTapCard: () {},
            );
          },
        ),
      );
    }
    return const Center(
      child: Text('Não há personagens',
          style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }
}
