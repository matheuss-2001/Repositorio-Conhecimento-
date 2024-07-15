import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/widgets/card_index_lista_personagem.dart';
import 'package:marvel/ui/listagem_personagens/controller/listagem_personagens_controller.dart';
import 'package:marvel/ui/listagem_personagens/data/model/personagem_marvel_viewmodel.dart';

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
        return _listaPersonagemMarvel();
      },
    );
  }

  Widget _listaPersonagemMarvel() {
    if (controller.marvelViewmodel.listaPersonagensViewmodel.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () async {}, //=> controller.getNotifications(false),
        child: AnimatedList(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(16),
          initialItemCount:
              controller.marvelViewmodel.listaPersonagensViewmodel.length,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            PersonagemMarvelViewmodel itemPersonagemIndex =
                controller.marvelViewmodel.listaPersonagensViewmodel[index];
            return CardIndexListaPersonagem(
              id: ValueKey<int>(itemPersonagemIndex.id),
              personagemName: itemPersonagemIndex.name,
              personagemUrl: itemPersonagemIndex
                  .imagemPersonagemViewmodel.imagemComExtensao,
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
