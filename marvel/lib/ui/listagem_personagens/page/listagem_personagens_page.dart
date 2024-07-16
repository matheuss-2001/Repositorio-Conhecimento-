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
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text(
        "MARVEL",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            wordSpacing: 0.5,
            fontSize: 25),
      ),
    );
  }

  GetBuilder _buildBody(BuildContext context, Size size) {
    return GetBuilder<ListagemPersonagensController>(
      id: "listaPersonagemBuilder",
      builder: (controller) {
        if (controller.gettingListaPersonagens) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        }
        return _listaPersonagemMarvel();
      },
    );
  }

  Widget _listaPersonagemMarvel() {
    if (controller.marvelViewmodel.listaPersonagensViewmodel.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () => controller.updateListagemPersonagem(),
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
              personagemPhotoUrl: itemPersonagemIndex
                  .imagemPersonagemViewmodel.imagemComExtensao,
              onTapCard: () {
                controller.onTapIndexListaCard(itemPersonagemIndex.id);
              },
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
