import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/ui/detalhe_personagem/controller/detalhe_personagem_controller.dart';

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
          if (!controller.gettingPersonagemDetalhe) {
            return Container();
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
                      fit: BoxFit.cover,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                              color: const Color(0XFFCDCDCD),
                              width: 0.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0.0),
                                blurRadius: 15.0,
                                spreadRadius: 2.0,
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                controller.detalhePersongemViewmdel.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                controller.detalhePersongemViewmdel.description,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
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
                            Tab(text: "Events"),
                            Tab(text: "Comics"),
                            Tab(text: "Series"),
                            Tab(text: "Favoritos"),
                          ],
                        ),
                      ),
                      MarvelSepator.medium,
                      SizedBox(
                        height: size.height,
                        child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              _builListaEventsPersonagem(),
                              _buildListaComicsPersonagem(),
                              _buildListaSeriesPersonagem(),
                              _buildListaFavoritosPersonagem()
                            ]),
                      ),
                    ],
                  ),
                ]))
              ]);
        });
  }

  Widget _builListaEventsPersonagem() {
    if (controller
        .detalhePersongemViewmdel.events.listaEventMarvelViewmodel.isNotEmpty) {
      return Container();
    } else {
      return const Center(
        child: Text(
          'Não há',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
  }

  Widget _buildListaComicsPersonagem() {
    return const Center(
      child: Text(
        'Não há',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildListaSeriesPersonagem() {
    return const Center(
      child: Text(
        'Não há',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildListaFavoritosPersonagem() {
    return const Center(
      child: Text(
        'Não há',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
