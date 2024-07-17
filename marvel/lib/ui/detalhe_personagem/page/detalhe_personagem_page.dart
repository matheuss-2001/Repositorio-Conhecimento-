import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/app/widgets/card_obra.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_controller.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_controller.dart';
import 'package:marvel/ui/detalhe_personagem/data/models/obra_viewmodel.dart';

class DetalhePersonagemPage extends GetView<DetalhePersonagemController> {
  const DetalhePersonagemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _buildBody(context, size),
    );
  }

  GetBuilder _buildBody(BuildContext context, Size size) {
    return GetBuilder<DetalhePersonagemController>(
        id: "builderDetalhePersonagem",
        builder: (controller) {
          if (controller.gettingPersonagemDetalhe) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                  expandedHeight: size.height / 2.5,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [StretchMode.zoomBackground],
                    background: CachedNetworkImage(
                      imageUrl: controller.detalhePersongemViewmdel
                          .imagemPersonagemViewmodel.imagemComExtensao,
                      height: MediaQuery.sizeOf(context).height,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey,
                        child: const Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      MarvelSepator.medium,
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                            border: Border.all(
                              color: const Color(0XFFCDCDCD),
                              width: 0.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0.0),
                                blurRadius: 8,
                                spreadRadius: 2.0,
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(controller.detalhePersongemViewmdel.name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                  textAlign: TextAlign.center),
                              Text(
                                  controller
                                      .detalhePersongemViewmdel.description,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                      MarvelSepator.small,
                      SizedBox(
                        height: 50,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          splashBorderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 16, left: 16),
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.red.shade500,
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          indicator: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle),
                          controller: controller.tabController,
                          tabs: const [
                            Tab(text: "Comics"),
                            Tab(text: "Events"),
                            Tab(text: "Series"),
                            Tab(text: "Stories"),
                          ],
                        ),
                      ),
                      MarvelSepator.medium,
                      SizedBox(
                        height: size.height / 2,
                        child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              _builListaComicsPersonagem(),
                              _buildListaEventsPersonagem(),
                              _buildListaSeriesPersonagem(),
                              _buildListaStoriesPersonagem(),
                            ]),
                      ),
                    ],
                  ),
                ]))
              ]);
        });
  }

  Widget _builListaComicsPersonagem() {
    if (controller.listaComics.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: controller.listaComics.length,
          separatorBuilder: (context, index) {
            return MarvelSepator.medium;
          },
          itemBuilder: (context, index) {
            ObraViewmodel itemObraViewmodel = controller.listaComics[index];

            if (index == controller.listaComics.length - 1) {
              return Column(
                children: [
                  CardObra(
                    id: ValueKey<int>(itemObraViewmodel.id),
                    personagemName: itemObraViewmodel.title,
                    personagemUrl:
                        itemObraViewmodel.thumbnail.imagemComExtensao,
                    onTapCard: () {
                      controller.onTapCardObra(
                          itemObraViewmodel, ObraType.COMIC);
                    },
                  ),
                  MarvelSepator.big
                ],
              );
            }
            return CardObra(
              id: ValueKey<int>(itemObraViewmodel.id),
              personagemName: itemObraViewmodel.title,
              personagemUrl: itemObraViewmodel.thumbnail.imagemComExtensao,
              onTapCard: () {
                controller.onTapCardObra(itemObraViewmodel, ObraType.COMIC);
              },
            );
          });
    }
    return Center(
      child: Text(
        'Não há Comics para ${controller.detalhePersongemViewmdel.name}',
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildListaEventsPersonagem() {
    if (controller.listaEvent.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: controller.listaEvent.length,
          separatorBuilder: (context, index) {
            return MarvelSepator.medium;
          },
          itemBuilder: (context, index) {
            ObraViewmodel itemObraViewmodel = controller.listaEvent[index];

            if (index == controller.listaEvent.length - 1) {
              return Column(
                children: [
                  CardObra(
                    id: ValueKey<int>(itemObraViewmodel.id),
                    personagemName: itemObraViewmodel.title,
                    personagemUrl:
                        itemObraViewmodel.thumbnail.imagemComExtensao,
                    onTapCard: () {
                      controller.onTapCardObra(
                          itemObraViewmodel, ObraType.EVENT);
                    },
                  ),
                  MarvelSepator.big
                ],
              );
            }
            return CardObra(
              id: ValueKey<int>(itemObraViewmodel.id),
              personagemName: itemObraViewmodel.title,
              personagemUrl: itemObraViewmodel.thumbnail.imagemComExtensao,
              onTapCard: () {
                controller.onTapCardObra(itemObraViewmodel, ObraType.EVENT);
              },
            );
          });
    }
    return Center(
      child: Text(
        'Não há Events para ${controller.detalhePersongemViewmdel.name}',
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildListaSeriesPersonagem() {
    if (controller.listaSeries.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: controller.listaSeries.length,
          separatorBuilder: (context, index) {
            return MarvelSepator.medium;
          },
          itemBuilder: (context, index) {
            ObraViewmodel itemObraViewmodel = controller.listaSeries[index];

            if (index == controller.listaSeries.length - 1) {
              return Column(
                children: [
                  CardObra(
                    id: ValueKey<int>(itemObraViewmodel.id),
                    personagemName: itemObraViewmodel.title,
                    personagemUrl:
                        itemObraViewmodel.thumbnail.imagemComExtensao,
                    onTapCard: () {
                      controller.onTapCardObra(
                          itemObraViewmodel, ObraType.SERIE);
                    },
                  ),
                  MarvelSepator.big
                ],
              );
            }
            return CardObra(
              id: ValueKey<int>(itemObraViewmodel.id),
              personagemName: itemObraViewmodel.title,
              personagemUrl: itemObraViewmodel.thumbnail.imagemComExtensao,
              onTapCard: () {
                controller.onTapCardObra(itemObraViewmodel, ObraType.SERIE);
              },
            );
          });
    }

    return Center(
      child: Text(
        'Não há Series para ${controller.detalhePersongemViewmdel.name}',
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildListaStoriesPersonagem() {
    if (controller.listaStories.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: controller.listaStories.length,
          separatorBuilder: (context, index) {
            return MarvelSepator.medium;
          },
          itemBuilder: (context, index) {
            ObraViewmodel itemObraViewmodel = controller.listaStories[index];

            if (index == controller.listaStories.length - 1) {
              return Column(
                children: [
                  CardObra(
                    id: ValueKey<int>(itemObraViewmodel.id),
                    personagemName: itemObraViewmodel.title,
                    personagemUrl:
                        itemObraViewmodel.thumbnail.imagemComExtensao,
                    onTapCard: () {
                      controller.onTapCardObra(
                          itemObraViewmodel, ObraType.STORY);
                    },
                  ),
                  MarvelSepator.big
                ],
              );
            }
            return CardObra(
              id: ValueKey<int>(itemObraViewmodel.id),
              personagemName: itemObraViewmodel.title,
              personagemUrl: itemObraViewmodel.thumbnail.imagemComExtensao,
              onTapCard: () {
                controller.onTapCardObra(itemObraViewmodel, ObraType.STORY);
              },
            );
          });
    }

    return Center(
      child: Text(
        'Não há Stories para ${controller.detalhePersongemViewmdel.name}',
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
