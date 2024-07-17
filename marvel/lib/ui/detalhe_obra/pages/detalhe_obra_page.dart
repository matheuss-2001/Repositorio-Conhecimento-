import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/app/widgets/card_detalhe_obra.dart';
import 'package:marvel/ui/detalhe_obra/controller/detalhe_obra_controller.dart';
import 'package:marvel/ui/detalhe_obra/data/models/response_personagens.dart';

class DetalheObraPage extends GetView<DetalheObraController> {
  const DetalheObraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _buildBody(context, size),
    );
  }

  GetBuilder _buildBody(BuildContext context, Size size) {
    return GetBuilder<DetalheObraController>(
        id: "builderDetalheObra",
        builder: (controller) {
          if (controller.gettingObraDetalhe) {
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
                      imageUrl: controller.urlPhoto,
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
                                color: Colors.black.withOpacity(0.01),
                              ),
                            ],
                          ),
                          child: const Text(
                            "PERSONAGENS",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      MarvelSepator.medium,
                      SizedBox(
                          height: size.height / 2,
                          child: _builListaComicsPersonagem()),
                    ],
                  ),
                ]))
              ]);
        });
  }

  Widget _builListaComicsPersonagem() {
    if (controller.dataPersonagemEvent.results.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: controller.dataPersonagemEvent.results.length,
          separatorBuilder: (context, index) {
            return MarvelSepator.medium;
          },
          itemBuilder: (context, index) {
            Character itemObraViewmodel =
                controller.dataPersonagemEvent.results[index];

            if (index == controller.dataPersonagemEvent.results.length - 1) {
              return Column(
                children: [
                  CardDetalheObra(
                    id: ValueKey<int>(itemObraViewmodel.id),
                    personagemName: itemObraViewmodel.name,
                    personagemUrl:
                        itemObraViewmodel.thumbnail.imagemComExtensao,
                  ),
                  MarvelSepator.big
                ],
              );
            }
            return CardDetalheObra(
              id: ValueKey<int>(itemObraViewmodel.id),
              personagemName: itemObraViewmodel.name,
              personagemUrl: itemObraViewmodel.thumbnail.imagemComExtensao,
            );
          });
    }
    return const Center(
      child: Text(
        'Não há personagens',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
